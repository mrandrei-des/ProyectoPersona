<%@ Page Title="Persona" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Persona.aspx.vb" Inherits="Persona.Persona" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Para validar campos:
            Se usa el elemento: RequiredFieldValidator(rfv)
                Tiene prioridad en un formulario, hasta que no se complete no deja que el botón haga su acción
    --%>

    <!-- Tipo Identificación -->
    <div class="form-group">
        <asp:Label ID="lblTipoDocumento" runat="server" Text="Tipo Documento:" CssClass="control-label"></asp:Label>
        <asp:DropDownList ID="ddlTipoDocumento" runat="server" CssClass="form-control">
            <asp:ListItem Value="" Text="Seleccione un tipo de documento"/>
            <asp:ListItem Value="1" Text="Cédula Física"/>
            <asp:ListItem Value="2" Text="Cédula Jurídica"/>
            <asp:ListItem Value="3" Text="Pasaporte"/>
            <asp:ListItem Value="4" Text="DIMEX"/>
        </asp:DropDownList>
    </div>
       <%-- Validación del tipo de idenficación --%>
    <asp:RequiredFieldValidator ID="rfvTipoDocumento" runat="server" ErrorMessage="Es necesario seleccionar un tipo de identificación." ControlToValidate="ddlTipoDocumento" display="Dynamic"></asp:RequiredFieldValidator>

    <!-- Identificación -->
    <div class="form-group">
        <asp:Label ID="lblDocumento" runat="server" Text="Documento:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="txtDocumento" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
        <%-- Validación de la identificación --%>
    <asp:RequiredFieldValidator ID="rfvIdentificacion" runat="server" ErrorMessage="Es necesario ingresar la identificación." ControlToValidate="txtDocumento" display="Dynamic"></asp:RequiredFieldValidator>

    <!-- Nombre -->
    <div class="form-group">
        <asp:Label ID="lblNombre" runat="server" Text="Nombre:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
        <%-- Validación del nombre --%>
    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ErrorMessage="Es necesario ingresar el nombre." ControlToValidate="txtNombre" display="Dynamic"></asp:RequiredFieldValidator>
    
    <!-- Apellidos -->    <div class="form-group">
        <asp:Label ID="lblApellidos" runat="server" Text="Apellidos:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
        <%-- Validación del apellido --%>
    <asp:RequiredFieldValidator ID="rfvApellidos" runat="server" ErrorMessage="Es necesario ingresar sus apellidos." ControlToValidate="txtApellidos" display="Dynamic"></asp:RequiredFieldValidator>

    <!-- Fecha de Nacimiento -->
    <div class="form-group">
        <asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha de Nacimiento:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
    </div>
    <%-- Validación de la fecha de nacimiento --%>
    <asp:RequiredFieldValidator ID="rfvFechaNacimiento" runat="server" ErrorMessage="Es necesario seleccionar una fecha de nacimiento." ControlToValidate="txtFechaNacimiento" display="Dynamic"></asp:RequiredFieldValidator>


    <!-- Correo Electrónico -->
    <div class="form-group">
        <asp:Label ID="lblCorreo" runat="server" Text="Correo Electrónico:" CssClass="control-label"></asp:Label>
        <asp:TextBox ID="txtCorreoElectronico" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
    </div>
        <%-- Validación de la fecha de nacimiento --%>
    <asp:RequiredFieldValidator ID="rfvCorreoElectronico" runat="server" ErrorMessage="Es necesario ingresar el correo electrónico." ControlToValidate="txtCorreoElectronico" display="Dynamic"></asp:RequiredFieldValidator>

    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary my-2" OnClick="btnGuardar_Click"/>

    <asp:Label ID="lblResultado" runat="server" Text="" CssClass="control-label"></asp:Label>

    <asp:Label ID="lblListaPersonas" runat="server" Text="Lista de Personas" CssClass="control-label"></asp:Label>
    <asp:GridView ID="gvPersonas" runat="server" AutoGenerateColumns="False" DataKeyNames="IDPersona" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="IDPersona" HeaderText="IDPersona" InsertVisible="False" ReadOnly="True" SortExpression="IDPersona" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
            <asp:BoundField DataField="FechaNacimiento" HeaderText="Fecha Nacimiento" SortExpression="FechaNacimiento" />
            <asp:BoundField DataField="CorreoElectronico" HeaderText="Correo Electronico" SortExpression="CorreoElectronico" />
            <asp:BoundField DataField="TipoDocumento" HeaderText="Tipo Documento" SortExpression="TipoDocumento" />
            <asp:BoundField DataField="Documento" HeaderText="Documento" SortExpression="Documento" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:II-46ConnectionString %>" ProviderName="<%$ ConnectionStrings:II-46ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Personas]"></asp:SqlDataSource>

</asp:Content>
