Namespace Models
    Public Class Persona
        Private _tipoIdentificacion As String
        Private _identificacion As String
        Private _nombre As String
        Private _apellidos As String
        Private _fechaNacimiento As Date
        Private _correoElectronico As String

        Public Sub New()
        End Sub

        Public Sub New(nombre As String, apellidos As String)
            Me.Nombre = nombre
            Me.Apellidos = apellidos
        End Sub

        Public Sub New(tipoIdentificacion As String, identificacion As String, nombre As String, apellidos As String, fechaNacimiento As Date, correoElectronico As String)
            Me.TipoIdentificacion = tipoIdentificacion
            Me.Identificacion = identificacion
            Me.Nombre = nombre
            Me.Apellidos = apellidos
            Me.FechaNacimiento = fechaNacimiento
            Me.CorreoElectronico = correoElectronico
        End Sub

        Public Property TipoIdentificacion As String
            Get
                Return _tipoIdentificacion
            End Get
            Set(value As String)
                _tipoIdentificacion = value
            End Set
        End Property

        Public Property Identificacion As String
            Get
                Return _identificacion
            End Get
            Set(value As String)
                _identificacion = value
            End Set
        End Property

        Public Property Nombre As String
            Get
                Return _nombre
            End Get
            Set(value As String)
                _nombre = value
            End Set
        End Property

        Public Property Apellidos As String
            Get
                Return _apellidos
            End Get
            Set(value As String)
                _apellidos = value
            End Set
        End Property

        Public Property FechaNacimiento As Date
            Get
                Return _fechaNacimiento
            End Get
            Set(value As Date)
                _fechaNacimiento = value
            End Set
        End Property

        Public Property CorreoElectronico As String
            Get
                Return _correoElectronico
            End Get
            Set(value As String)
                _correoElectronico = value
            End Set
        End Property

        Public Function Resumen() As String
            Return $"Nombre: {Nombre} Apellidos: {Apellidos} | Correo: {CorreoElectronico}"
        End Function
    End Class
End Namespace