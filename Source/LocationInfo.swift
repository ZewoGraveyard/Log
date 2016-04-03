public class LocationInfo {
    //    #namespace     String   The name of the namespace / module
    //    #file          String   The name of the file in which it appears.
    //    #line          Int      The line number on which it appears.
    //    #column        Int      The column number in which it begins.
    //    #function      String   The name of the declaration in which it appears.
    //    #dsohandle     String   The dso handle.
    var file : String?
    var line : Int?
    var column : Int?
    var function : String?
    
    init (file: String? = nil, line: Int? = nil, column: Int? = nil, function: String? = nil) {
        
        self.file = file
        self.line = line
        self.column = column
        self.function = function
        
    }
}
