public protocol Appender : Stream {
    var name : String { get }
    var closed : Bool { get }
    var level : Log.Level { get }
    
    func append (event : LoggingEvent)
}
