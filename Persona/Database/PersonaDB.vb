Imports System.Security.Policy
Imports Persona.Models

Public Class PersonaDB

    Private db As New DbHelper
    Public Function CrearPersona(ByVal pPersona As Models.Persona) As Boolean
        Using db.GetConnection()
            Dim query As String = "INSERT INTO Personas (Nombre, Apellidos, FechaNacimiento, CorreoElectronico, TipoDocumento, Documento) VALUES (@Nombre, @Apellidos, @FechaNacimiento, @CorreoElectronico, @TipoDocumento, @Documento)"
            Dim parameters As New Dictionary(Of String, Object) From {
                {"@Nombre", pPersona.Nombre},
                {"@Apellidos", pPersona.Apellidos},
                {"@FechaNacimiento", pPersona.FechaNacimiento},
                {"@CorreoElectronico", pPersona.CorreoElectronico},
                {"@TipoDocumento", pPersona.TipoIdentificacion},
                {"@Documento", pPersona.Identificacion}
            }

            Return db.ExecuteNonQuery(query, parameters)
        End Using
        Return True
    End Function

    Public Function EliminarPersona(idPersona As Integer) As Boolean
        Dim query As String = "DELETE FROM PERSONAS WHERE IDPersona = @IDPersona"
        Dim parameters As New Dictionary(Of String, Object) From {
            {"@IDPersona", idPersona}
        }

        Return db.ExecuteNonQuery(query, parameters)

    End Function
End Class
