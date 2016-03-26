package pyscript;

enum Const {
    CInt( v : Int ); // sorry we currenly do not support infinite big "python int"
    CFloat( f : Float );
    CImag( f : Float );
    CString( s : String );
//    CBytes( b : haxe.io.Bytes ); // I don't know if this is necessary
}
