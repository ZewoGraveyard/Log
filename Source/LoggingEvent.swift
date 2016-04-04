public struct LoggingEvent {

    public let locationInfo : LocationInfo
    public let timestamp : Int
    public let level : Log.Level
    public let name : String
    public let logger : Logger
    public var message : Any?
    public var error : ErrorProtocol?

    init (locationInfo : LocationInfo, timestamp: Int, level: Log.Level, name: String, logger: Logger, message: Any?, error: ErrorProtocol?) {

        self.locationInfo = locationInfo
        self.timestamp = timestamp
        self.level = level
        self.name = name
        self.logger = logger
        self.message = message
        self.error = error

    }
}
