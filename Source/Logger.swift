import Venice
public class Logger {
    
    //    #namespace     String   The name of the namespace / module
    //    #file          String   The name of the file in which it appears.
    //    #line          Int      The line number on which it appears.
    //    #column        Int      The column number in which it begins.
    //    #function      String   The name of the declaration in which it appears.
    //    #dsohandle     String   The dso handle.
    
    var appenders = [Appender]()
    var levels : Log.Level
    var name : String
    
    public init(name: String, appender: Appender, levels: Log.Level = .all) {
        appenders.append(appender)
        self.levels = levels
        self.name = name
    }
    
    public init(name: String, appenders: [Appender], levels: Log.Level = .all) {
        self.appenders.append(contentsOf: appenders)
        self.levels = levels
        self.name = name
    }
    
    public func log(item: Any, error: ErrorProtocol? = nil, _ file: String = #file, _ function: String = #function, _ line: Int = #line, _ column: Int = #column) {
        let locationInfo = LocationInfo(file: file, line: line, column: column, function: function)
        let event = LoggingEvent(locationInfo: locationInfo, timestamp: now, level: self.levels, name: self.name, logger: self, message: item, error: error)
        for apender in appenders {
            apender.append(event)
        }
    }
    
    
    public func log(level: Log.Level, item: Any, error: ErrorProtocol? = nil, _ file: String = #file, _ function: String = #function, _ line: Int = #line, _ column: Int = #column) {
        let locationInfo = LocationInfo(file: file, line: line, column: column, function: function)
        let event = LoggingEvent(locationInfo: locationInfo, timestamp: now, level: level, name: self.name, logger: self, message: item, error: error)
        for apender in appenders {
            apender.append(event)
        }
    }
    
    public func trace(item: Any, error: ErrorProtocol? = nil, _ file: String = #file, _ function: String = #function, _ line: Int = #line, _ column: Int = #column) {
        log(.trace, item: item, error: error, file, function, line, column)
    }
    
    public func debug(item: Any, error: ErrorProtocol? = nil, _ file: String = #file, _ function: String = #function, _ line: Int = #line, _ column: Int = #column) {
        log(.debug, item: item, error: error, file, function, line, column)
    }
    
    public func info(item: Any, error: ErrorProtocol? = nil, _ file: String = #file, _ function: String = #function, _ line: Int = #line, _ column: Int = #column) {
        log(.info, item: item, error: error, file, function, line, column)
    }
    
    public func warning(item: Any, error: ErrorProtocol? = nil, _ file: String = #file, _ function: String = #function, _ line: Int = #line, _ column: Int = #column) {
        log(.warning, item: item, error: error, file, function, line, column)
    }
    
    public func error(item: Any, error: ErrorProtocol? = nil, _ file: String = #file, _ function: String = #function, _ line: Int = #line, _ column: Int = #column) {
        log(.error, item: item, error: error, file, function, line, column)
    }
    
    public func fatal(item: Any, error: ErrorProtocol? = nil, _ file: String = #file, _ function: String = #function, _ line: Int = #line, _ column: Int = #column) {
        log(.fatal, item: item, error: error, file, function, line, column)
    }
   
}
