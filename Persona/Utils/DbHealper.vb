Imports System.Data.SqlClient

Public Class DbHealper
    Private connectionString As String = ConfigurationManager.ConnectionStrings("II-46ConnectionString").ConnectionString

    Public Function GetConnection() As SqlConnection
        Return New SqlConnection(connectionString)
    End Function
End Class
