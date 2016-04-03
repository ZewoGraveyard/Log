public class LoggingEvent {
    
    var locationInfo : LocationInfo
    var timestamp : Int64
    var level : Log.Level
    var name : String
    var logger : Logger
    var message : Any?
    var error : ErrorProtocol?
    
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
