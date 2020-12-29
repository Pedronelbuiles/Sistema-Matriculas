<%@ Page Title="" Language="C#" MasterPageFile="~/mdiPrincipal.Master" AutoEventWireup="true" CodeBehind="frmMatriculas.aspx.cs" Inherits="prjMatriculas.frmMatriculas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphPpal" runat="server">
    <div class="container-fluid text-center">
        <asp:label id="lblMensaje" runat="server" visible="false"></asp:label>
        <div class="input-group">
            <asp:label id="lblDocumento" runat="server" cssclass="input-group-addon" text="Documento"></asp:label>
            <asp:textbox id="txtDocumento" runat="server" cssclass="form-control"></asp:textbox>
        </div>
        <br />
        <div class="input-group">
            <asp:label id="lblEstudiante" runat="server" cssclass="input-group-addon" text="Estudiante"></asp:label>
            <asp:textbox id="txtEstudiante" runat="server" cssclass="form-control" ReadOnly="true"></asp:textbox>
        </div>
        <br />
        <div class="input-group">
            <asp:label id="lblCarnet" runat="server" cssclass="input-group-addon" text="Carnet"></asp:label>
            <asp:textbox id="txtCarnet" runat="server" cssclass="form-control" ReadOnly="true"></asp:textbox>
        </div>
        <br />
        <div class="input-group">
            <asp:label id="lblPrograma" runat="server" cssclass="input-group-addon" text="Programa"></asp:label>
            <asp:dropdownlist id="ddlPrograma" runat="server" cssclass="form-control" autopostback="true"></asp:dropdownlist>
        </div>
        <br />
        <div class="input-group">
            <asp:label id="lblAsignatura" runat="server" cssclass="input-group-addon" text="Asignatura"></asp:label>
            <asp:dropdownlist id="ddlAsignatura" runat="server" cssclass="form-control" autopostback="true" onselectedindexchanged="ddlAsignatura_SelectedIndexChanged"></asp:dropdownlist>
        </div>
        <br />
        <div class="input-group">
            <asp:label id="lblDocente" runat="server" cssclass="input-group-addon" text="Docente"></asp:label>
            <asp:dropdownlist id="ddlDocente" runat="server" cssclass="form-control" autopostback="true" onselectedindexchanged="ddlDocente_SelectedIndexChanged"></asp:dropdownlist>
        </div>
        <br />
        <div class="input-group">
            <asp:label id="lblAula" runat="server" cssclass="input-group-addon" text="Aula"></asp:label>
            <asp:dropdownlist id="ddlAula" runat="server" cssclass="form-control" autopostback="true"></asp:dropdownlist>
        </div>
        <br />
        <div class="input-group">
            <asp:label id="lblDiaCurso" runat="server" cssclass="input-group-addon" text="DiaCurso"></asp:label>
            <asp:textbox id="txtDiaCurso" runat="server" cssclass="form-control"></asp:textbox>
        </div>
        <br />
        <div class="input-group">
            <asp:label id="lblHrInicio" runat="server" cssclass="input-group-addon" text="HrInicio"></asp:label>
            <asp:textbox id="txtHrInicio" runat="server" cssclass="form-control"></asp:textbox>
            <asp:label id="lblHrFin" runat="server" cssclass="input-group-addon" text="HrFin"></asp:label>
            <asp:textbox id="txtHrFin" runat="server" cssclass="form-control"></asp:textbox>
        </div>
        <br />
        <asp:button id="btnMatricular" runat="server" cssclass="btn btn-success" text="Matricular" onclick="btnMatricular_Click" />
        <asp:button id="btnBuscEstud" runat="server" cssclass="btn btn-success" text="Buscar Estudiante" OnClick="btnBuscEstud_Click"/>
        <asp:button id="btnLimpiar" runat="server" cssclass="btn btn-success" text="Limpiar" OnClick="btnLimpiar_Click"/>
        <asp:button id="btnImprimir" runat="server" cssclass="btn btn-success" text="Imprimir" />
        <br />
        <br />
        <br />
        <br />
        <asp:gridview id="gvMatricula" runat="server" cssclass="table table-responsive table-bordered table-condensed table-hover"></asp:gridview>
    </div>
</asp:Content>
