package cn.examsys.common;

import java.lang.reflect.Field;

/**
 * Bean的自动填充类
 * @author lrx
 * 2018年5月31日
 */
public class BeanAutoFit {
	
	/**
	 * 自动填充随机属性值
	 * 用于数据库数据添加
	 * @param target
	 * @throws Exception
	 */
	public static <T> T autoFit(T target) throws Exception {
		Field fs[] = target.getClass().getDeclaredFields();
		for (int i = 0; i < fs.length; i++) {
			Field f = fs[i];
			f.setAccessible(true);
			if (f.getType().equals(int.class) || f.getType().equals(Integer.class)) {
				f.setInt(target, (int)(Math.random() * 99999));
			} else if (f.getType().equals(float.class) || f.getType().equals(Float.class)) {
				f.setFloat(target, (float)(Math.random() * 99999));
			} else if (f.getType().equals(boolean.class) || f.getType().equals(Boolean.class)) {
				f.setBoolean(target, (Math.random() > 0.5));
			} else {
				f.set(target, f.getName() + "_" + (int)(Math.random() * 99999));
			}
			
		}
		return target;
	}
	
	/**
	 * demo
	 */
	public static void main(String[] args) {
		
		class User {
			String name;
			int age;
			String sex;
			boolean handsome;
			@Override
			public String toString() {
				return "User [name=" + name + ", age=" + age + ", sex=" + sex
						+ ", handsome=" + handsome + "]";
			}
		}
		
		User u = new User();
		try {
			autoFit(u);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(u);
	}
	
	
}
