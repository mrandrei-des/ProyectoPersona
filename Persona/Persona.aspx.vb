Imports System.Web.WebSockets
Imports Persona.Utils

Public Class Persona
    Inherits System.Web.UI.Page
    Private db As New PersonaDB()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub limpiarCampos()
        txtNombre.Text = ""
        txtApellidos.Text = ""
        txtFechaNacimiento.Text = ""
        txtCorreoElectronico.Text = ""
        ddlTipoDocumento.SelectedIndex = 0
        txtDocumento.Text = ""
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Dim persona As New Models.Persona()
        Dim personaDB As New PersonaDB

        ' Validar los campos obligatorios
        'If txtFechaNacimiento.Text.Trim() = "" Then
        '    lblResultado.Text = "Por favor, complete todos los campos obligatorios."
        '    Return
        'End If

        persona.Nombre = txtNombre.Text.Trim()
        persona.Apellidos = txtApellidos.Text.Trim()
        persona.FechaNacimiento = txtFechaNacimiento.Text
        persona.CorreoElectronico = txtCorreoElectronico.Text.Trim()
        persona.TipoIdentificacion = ddlTipoDocumento.SelectedItem.Value
        persona.Identificacion = txtDocumento.Text

        If personaDB.CrearPersona(persona) Then
            SwalUtils.ShowSwal(Me, "¡Persona creada exitosamente!")
            gvPersonas.DataBind()
            'Response.Redirect("Persona.aspx")
        Else
            SwalUtils.ShowSwalError(Me, "Ha ocurrido un problema a la hora de crear la persona.")
        End If


        ' Insertar texto en un label desde el code behind
        'If personaDB.CrearPersona(persona) Then
        '    lblResultado.Text =
        '    "<br/> Nombre: " & persona.Nombre & "<br/>" &
        '    "Apellidos: " & persona.Apellidos & "<br/>" &
        '    "Fecha Nacimiento: " & persona.FechaNacimiento & "<br/>" &
        '    "Correo: " & persona.CorreoElectronico & "<br/>" &
        '    "Documento: " & persona.TipoIdentificacion & " - " & persona.Identificacion

        '    lblResultado.Text = $"<br/> {persona.Resumen()}"
        '    lblResultado.Text = $"<br/> {persona.Nombre} {persona.Apellidos} ha sido ingresado con éxito."

        'Else
        '    lblResultado.Text = $"<br/> No se logró ingresar a la persona."
        'End If


    End Sub
End Class