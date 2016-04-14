// Appender.swift
//
// The MIT License (MIT)
//
// Copyright (c) 2015 Zewo
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

public class Logger {
    //    #namespace     String   The name of the namespace / module
    //    #file          String   The name of the file in which it appears.
    //    #line          Int      The line number on which it appears.
    //    #column        Int      The column number in which it begins.
    //    #function      String   The name of the declaration in which it appears.
    //    #dsohandle     String   The dso handle.

    var appenders = [Appender]()
    var levels: Log.Level
    var name: String

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

    public func log(item: Any?, error: ErrorProtocol? = nil, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
        let locationInfo = LocationInfo(file: file, line: line, column: column, function: function)
        let event = LoggingEvent(locationInfo: locationInfo, timestamp: currentTime, level: self.levels, name: self.name, logger: self, message: item, error: error)
        for apender in appenders {
            apender.append(event: event)
        }
    }

    private func logWithLevel(level: Log.Level, item: Any?, error: ErrorProtocol? = nil, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
        let locationInfo = LocationInfo(file: file, line: line, column: column, function: function)
        let event = LoggingEvent(locationInfo: locationInfo, timestamp: currentTime, level: level, name: self.name, logger: self, message: item, error: error)
        for apender in appenders {
            apender.append(event: event)
        }
    }

    public func trace(item: Any?, error: ErrorProtocol? = nil, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
        logWithLevel(level: .trace, item: item, error: error, file: file, function: function, line: line, column: column)
    }

    public func debug(item: Any?, error: ErrorProtocol? = nil, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
        logWithLevel(level: .debug, item: item, error: error, file: file, function: function, line: line, column: column)
    }

    public func info(item: Any?, error: ErrorProtocol? = nil, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
        logWithLevel(level: .info, item: item, error: error, file: file, function: function, line: line, column: column)
    }

    public func warning(item: Any?, error: ErrorProtocol? = nil, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
        logWithLevel(level: .warning, item: item, error: error, file: file, function: function, line: line, column: column)
    }

    public func error(item: Any?, error: ErrorProtocol? = nil, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
        logWithLevel(level: .error, item: item, error: error, file: file, function: function, line: line, column: column)
    }

    public func fatal(item: Any?, error: ErrorProtocol? = nil, file: String = #file, function: String = #function, line: Int = #line, column: Int = #column) {
        logWithLevel(level: .fatal, item: item, error: error, file: file, function: function, line: line, column: column)
    }

    private var currentTime: Int {
      var tv = timeval()
      gettimeofday(&tv, nil)
      return tv.tv_sec
    }
}
