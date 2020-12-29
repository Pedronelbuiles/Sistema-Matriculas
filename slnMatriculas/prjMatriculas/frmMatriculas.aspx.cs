using libMatriculaOpe;
using System;
using System.Reflection;
using System.Web.UI.WebControls;

namespace prjMatriculas
{
    public partial class frmMatriculas : System.Web.UI.Page
    {

        #region "Variables Globales"
        private static string strNombreAplica;
        #endregion

        #region "Métodos Privados"
        private void mostrarMsj(string mensaje)
        {
            this.lblMensaje.Text = mensaje;
            if (mensaje == string.Empty)
            {
                this.lblMensaje.Visible = false;
                return;
            }
            this.lblMensaje.Visible = true;
        }
        private bool validar(string strMetodoOrigen)
        {
            switch (strMetodoOrigen.ToLower())
            {
                case "matricular":                    
                    if (this.txtDocumento.Text.Trim() == string.Empty)
                    {
                        mostrarMsj("Debe buscar un estudiante");
                        return false;
                    }                                        
                    if (this.ddlAsignatura.SelectedIndex == 0)
                    {
                        mostrarMsj("Debe seleccionar una asignatura");
                        return false;
                    }
                    if (this.ddlDocente.SelectedIndex == 0)
                    {
                        mostrarMsj("Debe seleccionar un Docente");
                        return false;
                    }
                    if (this.ddlAula.SelectedIndex == 0)
                    {
                        mostrarMsj("Debe seleccionar un Aula");
                        return false;
                    }
                    if (this.txtDiaCurso.Text.Trim() == string.Empty)
                    {
                        mostrarMsj("Debe indicar el día del curso");
                        return false;
                    }
                    if (this.txtHrInicio.Text.Trim() == string.Empty)
                    {
                        mostrarMsj("Debe indicar la hora de inicio del curos");
                        return false;
                    }
                    if (this.txtHrInicio.Text.Trim() == string.Empty)
                    {
                        mostrarMsj("Debe indicar la hora de finalización del curos");
                        return false;
                    }
                    break;
                case "consesutidante":
                    if (this.txtDocumento.Text.Trim() == string.Empty)
                    {
                        mostrarMsj("Debe ingresar el documento para buscar el estudiante");
                        return false;
                    }
                    break;
                case "ddldocente":
                    if (this.ddlAsignatura.SelectedIndex == 0)
                    {
                        mostrarMsj("Debe seleccionar una asignatura");
                        return false;
                    }
                    break;
                case "ddlaula":
                    if (this.ddlAsignatura.SelectedIndex == 0)
                    {
                        mostrarMsj("Debe seleccionar una asignatura");
                        return false;
                    }
                    if (this.ddlDocente.SelectedIndex == 0)
                    {
                        mostrarMsj("Debe seleccionar un Docente");
                        return false;
                    }
                    break;
            }            
            return true;
        }
        private void matricular()
        {
            try
            {
                if (!validar("matricular"))
                {
                    return;
                }
                clsMatriculasOpe objMatri = new clsMatriculasOpe(strNombreAplica);

                objMatri.DocEstudiante = this.txtDocumento.Text.Trim();
                objMatri.Asignatura = Convert.ToInt32(this.ddlAsignatura.SelectedValue);
                objMatri.Docente = Convert.ToInt32(this.ddlDocente.SelectedValue);
                objMatri.Aula = Convert.ToInt32(this.ddlAula.SelectedValue);
                objMatri.DiaCurso = this.txtDiaCurso.Text.Trim();
                objMatri.HoraIni = this.txtHrInicio.Text.Trim();
                objMatri.HoraFin = this.txtHrFin.Text.Trim();
                objMatri.GvGen = this.gvMatricula;

                if (!objMatri.matricularOpe())
                {
                    mostrarMsj(objMatri.Error);
                    objMatri = null;
                    return;
                }
                mostrarMsj(objMatri.Mensaje);
                limpiar("asignatura");
                habilitarBotones("matricular");
                objMatri = null;
            }
            catch (Exception ex)
            {

                mostrarMsj(ex.Message);
            }
        }

        private void habilitarBotones(string strOrigen)
        {
            this.btnBuscEstud.Enabled = false;
            this.btnMatricular.Enabled = false;
            this.btnLimpiar.Enabled = true;
            this.btnImprimir.Enabled = false;
            switch (strOrigen.ToLower())
            {
                case "page_load":
                    goto case "matricular";
                case "matricular":
                    this.btnBuscEstud.Enabled = true;                    
                    break;
                case "buscarestudiante":
                    this.btnMatricular.Enabled = true;                    
                    this.btnImprimir.Enabled = true;
                    break;
                case "limpiar":
                    goto case "matricular";
            }
        }

        private void limpiar(string strTipoLimpieza)
        {
            if(strTipoLimpieza.ToLower() != "asignatura")
            {
                mostrarMsj("");
            }            
            switch (strTipoLimpieza.ToLower())
            {
                case "general":
                    this.txtDocumento.Text = string.Empty;
                    this.txtEstudiante.Text = string.Empty;
                    this.txtCarnet.Text = string.Empty;
                    this.ddlPrograma.SelectedIndex = 0;
                    this.ddlAsignatura.SelectedIndex = 0;
                    this.ddlDocente.SelectedIndex = 0;
                    this.ddlAula.SelectedIndex = 0;
                    this.txtDiaCurso.Text = string.Empty;
                    this.txtHrInicio.Text = string.Empty;
                    this.txtHrFin.Text = string.Empty;
                    this.gvMatricula.Visible = false;
                    break;
                case "asignatura":
                    this.ddlPrograma.SelectedIndex = 0;
                    this.ddlAsignatura.SelectedIndex = 0;
                    this.ddlDocente.SelectedIndex = 0;
                    this.ddlAula.SelectedIndex = 0;
                    this.txtDiaCurso.Text = string.Empty;
                    this.txtHrInicio.Text = string.Empty;
                    this.txtHrFin.Text = string.Empty;
                    break;
                case "ddldocente":
                    if(this.ddlDocente.Items.Count > 0)
                    {
                        this.ddlDocente.SelectedIndex = 0;

                    }
                    goto case "ddlaula";
                case "ddlaula":
                    if(this.ddlAula.Items.Count > 0)
                    {
                        this.ddlAula.SelectedIndex = 0;

                    }
                    break;
                case "buscarestudiante":
                    this.ddlPrograma.SelectedIndex = 0;
                    this.ddlAsignatura.SelectedIndex = 0;                    
                    if (this.ddlDocente.Items.Count > 0)
                    {
                        this.ddlDocente.SelectedIndex = 0;
                    }
                    if (this.ddlAula.Items.Count > 0)
                    {
                        this.ddlAula.SelectedIndex = 0;
                    }
                    this.txtDiaCurso.Text = string.Empty;
                    this.txtHrInicio.Text = string.Empty;
                    this.txtHrFin.Text = string.Empty;
                    break;

            }
        }

        private void llenarDropDown(DropDownList ddlDrop)
        {
            try
            {
                clsMatriculasOpe objOpe = new clsMatriculasOpe(strNombreAplica);
                switch (ddlDrop.ID.ToLower())
                {
                    case "ddldocente":
                        objOpe.Asignatura = Convert.ToInt32(this.ddlAsignatura.SelectedValue);
                        break;
                    case "ddlaula":
                        objOpe.Asignatura = Convert.ToInt32(this.ddlAsignatura.SelectedValue);
                        objOpe.Docente = Convert.ToInt32(this.ddlDocente.SelectedValue);
                        break;
                }
                limpiar(ddlDrop.ID);
                objOpe.DdlGen = ddlDrop;

                if (!objOpe.llenarDrop())
                {
                    mostrarMsj(objOpe.Error);
                    return;
                }
            }
            catch (Exception ex)
            {

                mostrarMsj(ex.Message);
            }
        }

        private void buscarEstudiante()
        {
            try
            {
                if (!validar("buscarEstudiante"))
                {
                    return;
                }
                clsMatriculasOpe objConsEst = new clsMatriculasOpe(strNombreAplica);

                objConsEst.DocEstudiante = this.txtDocumento.Text.Trim();
                objConsEst.GvGen = this.gvMatricula;

                if (!objConsEst.consEstudiante())
                {
                    mostrarMsj(objConsEst.Error);
                    objConsEst = null;
                    return;
                }
                this.txtEstudiante.Text = objConsEst.NombreEstudiante;
                this.txtCarnet.Text = objConsEst.Carne;
                limpiar("buscarestudiante");
                habilitarBotones("buscarestudiante");
            }
            catch (Exception ex)
            {

                mostrarMsj(ex.Message);
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                strNombreAplica = Assembly.GetExecutingAssembly().GetName().Name + ".xml";
                llenarDropDown(this.ddlAsignatura);                
                llenarDropDown(this.ddlPrograma);
                habilitarBotones("Page_Load");
            }
        }

        protected void btnMatricular_Click(object sender, EventArgs e)
        {
            matricular();
        }

        protected void ddlAsignatura_SelectedIndexChanged(object sender, EventArgs e)
        {            
            llenarDropDown(this.ddlDocente);
        }

        protected void ddlDocente_SelectedIndexChanged(object sender, EventArgs e)
        {
            llenarDropDown(this.ddlAula);
        }

        protected void btnBuscEstud_Click(object sender, EventArgs e)
        {
            buscarEstudiante();
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            limpiar("general");
            habilitarBotones("");
        }
    }
}