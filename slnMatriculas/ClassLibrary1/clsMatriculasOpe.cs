using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using libMatriculasRN;
using libLlenarGrids;

namespace libMatriculaOpe
{
    public class clsMatriculasOpe
    {
        #region "Atributos"
        private string strDocumento;        
        private string strNombreEstu;        
        private string strCarne;        
        private int intIdAsignatura;
        private int intIdDocente;
        private int intIdAula;
        private string strDiaCurso;
        private string strHrIni;
        private string strHrFin;
        private string strCarnet;
        private string strNombreApp;        
        private string strError;
        private DataSet dsDatos;
        private string strMensaje;
        DropDownList ddlGen;
        GridView gvGen;
        #endregion

        #region "Constructor"
        public clsMatriculasOpe(string nombreApp)
        {
            this.strNombreApp = nombreApp;
            strDocumento = string.Empty;            
            intIdAsignatura = -1;
            intIdDocente = -1;
            intIdAula = -1;
            strDiaCurso = string.Empty;
            strHrIni = string.Empty;
            strHrFin = string.Empty;
            strCarnet = string.Empty;
            strError = string.Empty;
        }
        #endregion

        #region "Propiedades"
        public string DocEstudiante { set => strDocumento = value; }
        public int Asignatura { set => intIdAsignatura = value; }
        public int Docente { set => intIdDocente = value; }
        public int Aula { set => intIdAula = value; }
        public string DiaCurso { set => strDiaCurso = value; }
        public string HoraIni { set => strHrIni = value; }
        public string HoraFin { set => strHrFin = value; }
        public string Error { get => strError; }
        public DataSet DatosRpta { get => dsDatos; }
        public string Mensaje { get => strMensaje;}
        public DropDownList DdlGen {set => ddlGen = value; }
        public GridView GvGen {set => gvGen = value; }
        public string NombreEstudiante { get => strNombreEstu;}
        public string Carne { get => strCarne;}
        #endregion

        #region "Métodos Privados"
        private bool validar(string metodoOrigen)
        {
            if (strNombreApp == string.Empty)
            {
                strError = "Olvido enviar el nombre de la palicación";
                return false;
            }            
            switch (metodoOrigen.ToLower())
            {
                case "matricularope":
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
                case "llenardrop":
                    if(ddlGen == null)
                    {
                        strError = "Debe enviar el Drop Down List para llenarlo";
                        return false;
                    }
                    break;
                case "llenargrid":
                    if (gvGen == null)
                    {
                        strError = "Debe enviar la grid para llenarla";
                        return false;
                    }
                    break;
                case "consestudiante":
                    if(gvGen == null)
                    {
                        strError = "Debe enviar un grid para consultar el estudiante";
                        return false;
                    }
                    if (strDocumento == string.Empty)
                    {
                        strError = "Debe enviar el documento para buscar el estudiante";
                        return false;
                    }
                    break;


            }
            return true;
        }

        private bool llenarGrid(DataTable dtDatos)
        {
            try
            {
                if (!validar("llenarGrid"))
                {
                    return false;
                }
                clsLlenarGrids objGrids = new clsLlenarGrids();

                if (!objGrids.llenarGridWeb(gvGen, dtDatos))
                {
                    strError = objGrids.Error;
                    objGrids = null;
                    return false;
                }
                objGrids = null;
                return true;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        #endregion

        #region "Métodos públicos"
        public bool matricularOpe()
        {
            try
            {
                if (!validar("matricularOpe"))
                {
                    return false;
                }
                clsMatriculasRN objRn = new clsMatriculasRN(this.strNombreApp);

                objRn.DocEstudiante = strDocumento;
                objRn.Asignatura = intIdAsignatura;
                objRn.Docente = intIdDocente;
                objRn.Aula = intIdAula;
                objRn.DiaCurso = strDiaCurso;
                objRn.HoraIni = strHrIni;
                objRn.HoraFin = strHrFin;

                if (!objRn.matricular())
                {
                    strError = objRn.Error;
                    objRn = null;
                    return false;
                }
                if(objRn.DatosRptaBd.Tables[0].Rows[0]["CodRpta"].ToString() == "1")
                {
                    strError = objRn.DatosRptaBd.Tables[0].Rows[0]["Mensaje"].ToString();
                    objRn = null;
                    return false;                    
                }
                if(objRn.DatosRptaBd.Tables.Count > 1)
                {
                    if (!llenarGrid(objRn.DatosRptaBd.Tables[1]))
                    {
                        objRn = null;
                        return false;
                    }
                }
                strMensaje = objRn.DatosRptaBd.Tables[0].Rows[0]["Mensaje"].ToString();
                objRn = null;
                return true;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public bool llenarDrop()
        {
            try
            {
                if (!validar("llenarDrop"))
                {
                    return false;
                }

                clsMatriculasRN objRn = new clsMatriculasRN(strNombreApp);
                switch (ddlGen.ID.ToLower())
                {
                    case "ddldocente":
                        objRn.Asignatura = intIdAsignatura;
                        break;
                    case "ddlaula":
                        objRn.Asignatura = intIdAsignatura;
                        objRn.Docente = intIdDocente;
                        break;
                }
                

                if (!objRn.llenarDropDowns(ddlGen))
                {
                    strError = objRn.Error;
                    objRn = null;
                    return false;
                }
                objRn = null;
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
                if (!validar("consEstudiante"))
                {
                    return false;
                }
                clsMatriculasRN objConsRn = new clsMatriculasRN(strNombreApp);

                objConsRn.DocEstudiante = strDocumento;

                if (!objConsRn.consEstudiante())
                {
                    strError = objConsRn.Error;
                    objConsRn = null;
                    return false;
                }
                if(objConsRn.DatosRptaBd.Tables[0].Rows.Count == 0)
                {
                    strError = "Estudiante no existe";
                    return false;
                }
                strNombreEstu = objConsRn.DatosRptaBd.Tables[0].Rows[0]["Estudiante"].ToString();
                strCarne = objConsRn.DatosRptaBd.Tables[0].Rows[0]["Carne"].ToString();

                if(objConsRn.DatosRptaBd.Tables.Count > 1 && objConsRn.DatosRptaBd.Tables[1].Rows.Count > 0)
                {
                    if (!llenarGrid(objConsRn.DatosRptaBd.Tables[1]))
                    {
                        objConsRn = null;
                        return false;
                    }
                }
                objConsRn = null;
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
