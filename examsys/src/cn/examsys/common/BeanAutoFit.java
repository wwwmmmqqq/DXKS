package cn.examsys.common;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
			if (Arrays.toString(f.getAnnotations())
					.contains("javax.persistence.Id")
					&& (f.getType().equals(int.class)||f.getType().equals(Integer.class))) {
				//如果是主键
				continue;
			}
			
			if (f.getName().contains("difficultyValue")) {
				f.setInt(target, (int)(Math.random() * 3 + 1));
			} else if (f.getName().contains("type")) {
				String type_arr[] = new String[]{
						 Conf.Question_Single
						,Conf.Question_Multiple
						,Conf.Question_TrueOrFalse
						,Conf.Question_Fills
						,Conf.Question_Subjective
				};
				f.set(target, type_arr[(int)(Math.random() * type_arr.length)]);
			} else 
				
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
	
	public static <T> T autoFit(T target, Object what) throws Exception {
		Field fs[] = target.getClass().getDeclaredFields();
		for (int i = 0; i < fs.length; i++) {
			Field f = fs[i];
			f.setAccessible(true);
			if (Arrays.toString(f.getAnnotations())
					.contains("javax.persistence.Id")
					&& (f.getType().equals(int.class)||f.getType().equals(Integer.class))) {
				//如果是主键
				continue;
			}
			
			if (f.getName().contains("difficultyValue")) {
				f.setInt(target, (int)(Math.random() * 3 + 1));
			} else if (f.getName().contains("type")) {
				String type_arr[] = new String[]{
						 Conf.Question_Single
						,Conf.Question_Multiple
						,Conf.Question_TrueOrFalse
						,Conf.Question_Fills
						,Conf.Question_Subjective
				};
				f.set(target, type_arr[(int)(Math.random() * type_arr.length)]);
			} else 
				
			if (f.getType().equals(int.class) || f.getType().equals(Integer.class)) {
				f.setInt(target, what.hashCode() + (int)(Math.random() * 999));
			} else if (f.getType().equals(float.class) || f.getType().equals(Float.class)) {
				f.setFloat(target, (float) (Math.random() * 999));
			} else if (f.getType().equals(boolean.class) || f.getType().equals(Boolean.class)) {
				f.setBoolean(target, (Math.random() > 0.5));
			} else {
				if (!f.getName().equals("options")) {
					f.set(target, f.getName() + "_" + what + (int)(Math.random() * 999));
				}
			}
			
		}
		return target;
	}
	
	
	
	
	public static <T> List<T> fitBeanArray(Class<?> claz, Serializable obj) throws Exception {
		
		List<T> list = new ArrayList<>();
		for (int i = 0; i < 10; i++) {
			@SuppressWarnings("unchecked")
			T t = (T) claz.newInstance();
			try {
				BeanAutoFit.autoFit(t, obj);
				Field f = t.getClass().getDeclaredField("sid");
				f.setAccessible(true);
				f.setInt(t, (int)(Math.random() * 999));
				list.add(t);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
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
