package cn.examsys.common;

/**
 * 权限类
 * 相比Permission来讲，计算效率比较低
 * 但可用于权限数量庞大的应用，也便于数据库计算
 * 数据表权限字段为字符型
 * @author lrx
 * 2018年5月31日
 */
public class Permission2 {
	
	StringBuilder value = new StringBuilder();
	
	public Permission2 addPermission(String permission) {
		if (!hasPermission(permission)) {
			value.append(permission + " ");
		}
		return this;
	}
	
	public Permission2 removePermission(String permission) {
		value = new StringBuilder(value.toString().replaceFirst(permission + " ", ""));
		return this;
	}
	
	public boolean hasPermission(String permission) {
		return value.toString().indexOf(permission) >= 0;
	}
	
	@Override
	public String toString() {
		return value.toString();
	}
	
	public static void main(String[] args) {
		Permission2 permission2 = new Permission2();
		/**
		 * 添加权限
		 */
		permission2
			.addPermission("查看文件")
			.addPermission("删除文件")
			.addPermission("修改文件");
		
		System.out.println("当前权限：" + permission2);
		
		System.out.println("是否包含‘查看文件’权限：" + permission2.hasPermission("查看文件"));
		//去掉 '删除文件'权限
		System.out.println("去掉‘删除文件’权限");
		permission2.removePermission("删除文件");
		
		//判断权限
		System.out.println("是否包含‘删除文件’权限：" + permission2.hasPermission("删除文件"));
		
		System.out.println("当前权限：" + permission2);
		
	}
	
}
