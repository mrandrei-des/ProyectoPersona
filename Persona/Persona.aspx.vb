Public Class Persona
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Dim persona As New Models.Persona()

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

        lblResultado.Text =
            "<br/> Nombre: " & persona.Nombre & "<br/>" &
            "Apellidos: " & persona.Apellidos & "<br/>" &
            "Fecha Nacimiento: " & persona.FechaNacimiento & "<br/>" &
            "Correo: " & persona.CorreoElectronico & "<br/>" &
            "Documento: " & persona.TipoIdentificacion & " - " & persona.Identificacion

        lblResultado.Text = $"<br/> {persona.Resumen()}"
    End Sub
End Class