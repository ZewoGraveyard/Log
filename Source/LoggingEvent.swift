public class LoggingEvent {

    public var locationInfo : LocationInfo
    public var timestamp : Int64
    public var level : Log.Level
    public var name : String
    public var logger : Logger
    public var message : Any?
    public var error : ErrorProtocol?

    init (locationInfo : LocationInfo, timestamp: Int64, level: Log.Level, name: String, logger: Logger, message: Any?, error: ErrorProtocol?) {

        self.locationInfo = locationInfo
        self.timestamp = timestamp
        self.level = level
        self.name = name
        self.logger = logger
        self.message = message
        self.error = error

    }
}
