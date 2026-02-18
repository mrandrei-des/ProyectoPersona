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
        Dim errorMessage As String = ""

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

        If personaDB.CrearPersona(persona, errorMessage) Then
            SwalUtils.ShowSwal(Me, "¡Persona creada exitosamente!")
            gvPersonas.DataBind()
            limpiarCampos()
        Else
            SwalUtils.ShowSwalError(Me, errorMessage)
        End If

        ' Insertar texto en un label desde el code behind
        'lblResultado.Text = $"<br/> {persona.Resumen()}"
    End Sub

    Protected Sub gvPersonas_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        ' Cancela el evento eliminación predeterminada del gridview
        e.Cancel = True
        Dim personaDB As New PersonaDB
        Dim errorMessage As String = ""

        Dim idPersona As Integer = CInt(gvPersonas.DataKeys(e.RowIndex).Value)

        If personaDB.EliminarPersona(idPersona, errorMessage) Then
            SwalUtils.ShowSwal(Me, "¡La persona ha sido eliminada correctamente!")
            gvPersonas.DataBind()
        Else
            SwalUtils.ShowSwalError(Me, errorMessage)
        End If
    End Sub

    Protected Sub gvPersonas_RowEditing(sender As Object, e As GridViewEditEventArgs)
        e.Cancel = True
        Dim personaDB As New PersonaDB
        Dim errorMessage As String = ""
        Dim idPersona As Integer = CInt(gvPersonas.DataKeys(e.NewEditIndex).Value)

    End Sub

    Protected Sub gvPersonas_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim persona As New Models.Persona()
        Dim errorMessage As String = ""
        Dim selectedRow As GridViewRow = gvPersonas.SelectedRow

        Dim idPersona = selectedRow.Cells(0).Text
        persona = db.ConsultarPersona(idPersona, errorMessage)

        persona.Nombre = HttpUtility.HtmlDecode(selectedRow.Cells(1).Text)
        persona.Apellidos = HttpUtility.HtmlDecode(selectedRow.Cells(2).Text)
        persona.FechaNacimiento = selectedRow.Cells(3).Text
        persona.CorreoElectronico = selectedRow.Cells(4).Text
        persona.TipoIdentificacion = selectedRow.Cells(5).Text
        persona.Identificacion = selectedRow.Cells(6).Text
        ddlTipoDocumento.SelectedValue = selectedRow.Cells(5).Text

    End Sub
End Class