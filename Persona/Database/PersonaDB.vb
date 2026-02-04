Imports System.Security.Policy

Public Class PersonaDB

    Private db As New DbHealper
    Function CrearPersona(ByVal pPersona As Models.Persona) As Boolean
        Using db.GetConnection()
            Dim query As String = "INSERT INTO Personas (Nombre, Apellidos, FechaNacimiento, CorreoElectronico, TipoDocumento, Documento) VALUES (@Nombre, @Apellidos, @FechaNacimiento, @CorreoElectronico, @TipoDocumento, @Documento)"
            Dim parameters As New Dictionary(Of String, Object) From {
                {"@", pPersona.Nombre},
                {"@", pPersona.Apellidos},
                {"@", pPersona.FechaNacimiento},
                {"@", pPersona.CorreoElectronico},
                {"@", pPersona.TipoIdentificacion},
                {"@", pPersona.Identificacion}
            }
            'Falta crear el método para ejecutar el insert
        End Using
        Return True
    End Function

End Class
