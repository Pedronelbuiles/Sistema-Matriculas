using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using libConexionBd;
using libLlenarGrids;
using libLlenarCombos;

namespace libMatriculasRN
{
    public class clsMatriculasRN
    {
        #region "Atributos"
        private string strTipoCons;
        private string strDocumento;
        private int intIdAsignatura;        
        private int intIdDocente;
        private int intIdAula;
        private string strDiaCurso;
        private string strHrIni;
        private string strHrFin;
        private string strCarnet;
        private string strNombreApp;                
        private string strError;        
        private SqlParameter[] objDatosMatricula;
        private clsConexionBd objConex;
        private clsLlenarGrids objLlenaGrids;
        private DataSet dsDatos;
        #endregion

        #region "Constructor"
        public clsMatriculasRN(String nombreApp)
        {
            this.strNombreApp = nombreApp;
            strDocumento = string.Empty;
            intIdAsignatura = -1;
            intIdDocente = -1;
            strDiaCurso = string.Empty;
            strHrIni = string.Empty;
            strHrFin = string.Empty;
            intIdAula = -1;
            strCarnet = string.Empty;                        
            strError = string.Empty;
    }
        #endregion

        #region "Propiedades"        
        public string DocEstudiante {set => strDocumento = value; }
        public int Asignatura {set => intIdAsignatura = value; }
        public int Docente { set => intIdDocente = value; }
        public int Aula { set => intIdAula = value; }
        public string DiaCurso { set => strDiaCurso = value; }
        public string HoraIni { set => strHrIni = value; }
        public string HoraFin { set => strHrFin = value; }
        public string Error { get => strError;}        
        public DataSet DatosRptaBd { get => dsDatos;}
        #endregion

        #region "Métodos Privados"
        private bool validar(string metodoOrigen)
        {
            if(strNombreApp == string.Empty)
            {
                strError = "Olvido enviar el nombre de la palicación";
                return false;
            }            
            switch (metodoOrigen.ToLower())
            {
                case "matricular":
                    if (strDocumento == string.Empty)
                    {
                        strError = "Debe buscar un estudiante para" +
                            " realizar la matrícula";
                        return false;
                    }
                    if (intIdAsignatura <= 0)
                    {
                        strError = "Debe seleccionar un asignatura" +
                            " para la matrícula";
                        return false;
                    }
                    if (intIdDocente <= 0)
                    {
                        strError = "Debe seleccionar un docente" +
                            " para la matrícula";
                        return false;
                    }
                    if (intIdAula <= 0)
                    {
                        strError = "Debe seleccionar un Aula" +
                            " para la matrícula";
                        return false;
                    }
                    if (strDiaCurso == string.Empty)
                    {
                        strError = "Debe indicar que día es " +
                            "el curso para realizar la matrícula";
                        return false;
                    }
                    if (strHrIni == string.Empty)
                    {
                        strError = "Debe indicar la hora de inicio " +
                            "del curso para realizar la matrícula";
                        return false;
                    }
                    if (strHrFin == string.Empty)
                    {
                        strError = "Debe indicar la hora de finalización " +
                            "del curso para realizar la matrícula";
                        return false;
                    }
                    break;
                case "consestudiante":
                    if (strDocumento == string.Empty)
                    {
                        strError = "Debe buscar un estudiante para" +
                            " realizar la matrícula";
                        return false;
                    }
                    break;
            }
            return true;
        }

        private bool agregarParam(string metodoOrigen)
        {
            try
            {
                if (!validar(metodoOrigen))
                {
                    return false;
                }              

                switch (metodoOrigen.ToLower())
                {
                    case "matricular":
                        objDatosMatricula = new SqlParameter[7];
                        objDatosMatricula[0] = new SqlParameter("@CCEstudiante", strDocumento);
                        objDatosMatricula[1] = new SqlParameter("@Id_Curso", intIdAsignatura);
                        objDatosMatricula[2] = new SqlParameter("@Id_Docente", intIdDocente);
                        objDatosMatricula[3] = new SqlParameter("@Id_Aula", intIdAula);
                        objDatosMatricula[4] = new SqlParameter("@Dia_Curso", strDiaCurso);
                        objDatosMatricula[5] = new SqlParameter("@Hora_Inicio_Curso", strHrIni);
                        objDatosMatricula[6] = new SqlParameter("@Hora_Fin_Curso", strHrFin);
                        break;                    
                    case "llenardropdowns":
                        objDatosMatricula = new SqlParameter[3];
                        objDatosMatricula[0] = new SqlParameter("@TipoConsulta", strTipoCons);
                        objDatosMatricula[1] = new SqlParameter("@IdCurso", intIdAsignatura);
                        objDatosMatricula[2] = new SqlParameter("@IdDocente", intIdDocente);
                        break;                    
                    case "consestudiante":
                        objDatosMatricula = new SqlParameter[1];
                        objDatosMatricula[0] = new SqlParameter("@Cedula", strDocumento);
                        break;
                }
                return true;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        #endregion

        #region "Métodos Públicos"
        public bool matricular()
        {
            try
            {
                if (!agregarParam("Matricular"))
                {
                    return false;
                }

                objConex = new clsConexionBd(strNombreApp);
                objConex.SQL = "SP_MatricularEstudiante";
                objConex.ParametrosSQL = objDatosMatricula;

                if (!objConex.llenarDataSet(true, true))
                {
                    strError = objConex.Error;
                    objConex.cerrarCnx();
                    objConex = null;
                    return false;
                }                
                dsDatos = objConex.DataSetLleno;
                objConex.cerrarCnx();
                objConex = null;
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool llenarDropDowns(DropDownList ddlGen)
        {
            try
            {                
                String strCampoTexto = "";
                String strCampoId = "";
                switch (ddlGen.ID)
                {
                    case "ddlPrograma":
                        strTipoCons = "PROGRAMAS";
                        strCampoId = "Id";
                        strCampoTexto = "Carrera";
                        break;
                    case "ddlAsignatura":
                        strTipoCons = "CURSOS";
                        strCampoId = "Id";
                        strCampoTexto = "Curso";
                        break;
                    case "ddlDocente":
                        strTipoCons = "DOCENTES";
                        strCampoId = "Id";
                        strCampoTexto = "Docente";
                        break;
                    case "ddlAula":
                        strTipoCons = "AULAS";
                        strCampoId = "Id";
                        strCampoTexto = "Aula";
                        break;
                    default:
                        strError = "Control desconocido";
                        return false;
                }
                if (!agregarParam("llenarDropDowns"))
                {
                    return false;
                }
                clsLlenarCombos objLlenar = new clsLlenarCombos(strNombreApp);

                objLlenar.SQL = "SP_ConsultarComboMatricula";
                objLlenar.CampoID = strCampoId;
                objLlenar.CampoTexto = strCampoTexto;
                objLlenar.ParametrosSQL = objDatosMatricula;

                if (!objLlenar.llenarComboWeb(ddlGen))
                {
                    strError = objLlenar.Error;
                    objLlenar = null;
                    return false;
                }
                objLlenar = null;
                return true;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public bool consEstudiante()
        {
            try
            {
                if (!agregarParam("consEstudiante"))
                {
                    return false;
                }
                clsConexionBd objCnx = new clsConexionBd(strNombreApp);

                objCnx.SQL = "SP_ConsultarEstudiante";
                objCnx.ParametrosSQL = objDatosMatricula;

                if (!objCnx.llenarDataSet(true, true))
                {
                    strError = objCnx.Error;
                    objCnx.cerrarCnx();
                    objCnx = null;
                    return false;
                }
                dsDatos = objCnx.DataSetLleno;
                objCnx.cerrarCnx();
                objCnx = null;
                return true;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        
        #endregion
    }
}
