package cn.examsys.common;

import java.util.HashMap;
import java.util.Map;

/**
 * 权限类
 * 相比Permission2来讲，计算效率高，整形权限不易出错
 * 权限范围0到63
 * 可用于权限数量较小的应用，也可以利用数的性质来比较权限的大小：例如某个权限4小于权限8
 * 数据表权限字段为整形
 * @author lrx
 * 2018年5月31日
 */
public class Permission {
	
	public static void main(String[] args) {
		/**
		 * 权限用法
		 */
		Permission permission = new Permission(0);
		
		//添加权限 1 2 4 6 7 8 
		permission
			.addPermission(1)
			.addPermission(2)
			.addPermission(4)
			.addPermission(6)
			.addPermission(7)
			.addPermission(8);
		//判断权限
		for (int i = 0; i < 10; i++) {
			System.out.println("是否包含权限"+i+" : " + permission.hasPermission(i));
		}
		
		System.out.println("========");
		//去除权限7和权限0
		permission.removePermission(7);
		permission.removePermission(0);
		
		System.out.println("删除权限7后值为 ：" + permission);
		for (int i = 0; i < 10; i++) {
			System.out.println("是否包含权限 "+i+" : " + permission.hasPermission(i));
		}
		
	}
	
	
	private long value = 0;
	private String name;
	
	private static Map<String, Permission> pmstMap;
	
	public Permission(int n) {
		value = 1 << n;
	}
	
	public Permission(int n, String name) {
		this(n);
		this.name = name;
		if (pmstMap == null) {
			pmstMap = new HashMap<String, Permission>();
		}
		if (name != null) {
			pmstMap.put(name, this);
		}
	}
	
	
	public Permission addPermission(int n) {
		if (n > 63 || n < 0) {
			System.out.println(">>>范围应该为 0 ~ 63");
			return null;
		}
		this.value = addPermission(this, 1 << (n));
		return this;
	}
	
	public Permission removePermission(int n) {
		if (n > 63 || n < 0) {
			System.out.println(">>>范围应该为 0 ~ 63");
			return null;
		}
		this.value = removePermission(this, 1 << (n));
		return this;
	}
	
	public Permission removeAllPermission() {
		this.value = 0;
		return this;
	}
	
	public boolean hasPermission(int n) {
		return hasPermission(this, 1 << (n));
	}
	
	private long value() {
		return value;
	}
	
	@Override
	public String toString() {
		return this.value() + "";
	}
	
	public static Permission get(String name) {
		return pmstMap.get(name);
	}
	
	
	
	/**
	 * 添加permission权限后的值
	 */
	private static long addPermission(Permission pmst, int permission) {
		return (pmst.value() | permission);
	}
	/**
	 * 移除permission权限后的值
	 */
	private long removePermission(Permission pmst, int permission) {
		return pmst.value() & (~permission);
	}
	/**
	 * 判断是否包含权限
	 */
	private boolean hasPermission(Permission pmst, int permission) {
		return ((pmst.value() & permission) == permission);
	}
	
}
