package cn.examsys.common;

import java.lang.reflect.Field;

public class BeanAutoFit {
	
	/**
	 * 自动填充随机属性值
	 * 用于数据库数据添加
	 * @param target
	 * @throws Exception
	 */
	public static void autoFit(Object target) throws Exception {
		Field fs[] = target.getClass().getDeclaredFields();
		for (int i = 0; i < fs.length; i++) {
			Field f = fs[i];
			f.setAccessible(true);
			if (f.getAnnotations() != null && f.getAnnotations().length != 0) {
				f.set(target, "id_" + (int)(Math.random() * 999));
			} else if (f.getType().equals(int.class)) {
				f.setInt(target, i * 2);
			} else {
				f.set(target, f.getName() +"_"+ i);
			}
		}
	}
	
}
