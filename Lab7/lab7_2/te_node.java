import java.io.*;

public class te_node {

	public static final int TE_BASE = 1;
	public static final int TE_ARRAY = 3;
	public static final int TE_POINTER = 6;

    private int tag; // TE_BASE, TE_ARRAY, TE_POINTER
    private String code; // Base type (int, float, double, char, void, type_error)
	private int size; // If the node is an array, the number of its elements

	private te_node left, right; // Left and right children of the node
	
	/* Getters */
	public int getTag() {
		return tag;
	}
	
	public String getCode() {
		return code;
	}
	
	public int getSize() {
		return size;
	}
	
	public te_node getLeft() {
		return left;
	}
	
	public te_node getRight() {
		return right;
	}
	
	/* Setters */
	public void setTag(int tag) {
		this.tag = tag;
		return;
	}
	
	public void setCode(String code) {
		this.code = code;
		return;
	}
	
	public void setSize(int size) {
		this.size = size;
		return;
	}
	
	public void setLeft(te_node left) {
		this.left = left;
		return;
	}
	
	public void setRight(te_node right) {
		this.right = right;
		return;
	}

	/* Make a base type node (type constructor) */
	public static te_node te_make_base(String code) {
		te_node p = new te_node();
		p.setTag(TE_BASE);
		p.setCode(code);
		return p;
	}
	
	/* Make a pointer to a given node (type constructor) */
	public static te_node te_make_pointer(te_node base) {
		te_node p = new te_node();
		p.setTag(TE_POINTER);
		p.setLeft(base);
		return p;
	}
	
	/* Make an array given a node and a size (type constructor) */
	public static te_node te_make_array(int size, te_node base) {
		te_node p;
		p = new te_node();
		p.setTag(TE_ARRAY);
		p.setLeft(base);
		p.setSize(size);
		return p;
	}

	/* Print node info according to its type */
	public static void te_print(te_node node) {
		
		switch (node.getTag()) {
			case TE_BASE:
				 System.out.print("[" + node.getCode() + "]");
				 break;
			case TE_ARRAY:
				 System.out.print("array(" + node.getSize() + ",");
				 te_print(node.getLeft());
				 System.out.print(")");
				 break;
			case TE_POINTER:
				 System.out.print("pointer(");
				 te_print(node.getLeft());
				 System.out.print(")");
				 break;
		}
	}

	public String toString(){
		te_print(this);
		return "";
	}

}
