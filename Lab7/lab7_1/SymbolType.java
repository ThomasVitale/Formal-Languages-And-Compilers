import java.io.*;

public class SymbolType {
	private int type;
	private int size = 1;
	
	public SymbolType(int type) {
		this.type = type;
	}
	
	public SymbolType(int type, int size) {
		this.type = type;
		this.size = size;
	}
	
	public int getType() {
		return type;
	}
	
	public int getSize() {
		return size;
	}
	
	public boolean isArray() {
		if (size == 1) {
			return false;
		} else {
			return true;
		}
	}

}
