package cn.examsys.common;

import java.util.List;

public class QLBuilder {
	
	/*public static String buildHQL(String hql, List<String> keys, List<String> vals, String condition) {
		StringBuilder hqlb = new StringBuilder(hql);
		
		if (keys != null && keys.size() != 0) {
			hqlb.append(" where ");
		}
		for (int i = 0; vals!=null && i < vals.size(); i++) {
			vals.set(i, "%"+vals.get(i)+"%");
		}
		for (int i = 0; i < keys.size()-1; i++) {
			hqlb.append(keys.get(i) + " "+condition+" ");
		}
		if (keys != null && keys.size() != 0) {
			hqlb.append(keys.get(keys.size()-1) + " "+condition+" ");
		}
		return hqlb.toString();
	}
	*/
	
	public static int MODE_EQUALS = 1;
	public static int MODE_LIKE = 2;
	public static int LOGICAL_OR = 1;
	public static int LOGICAL_AND = 2;
	public static String builderHQL(List<String> keys, Class<?> claz, int MODE, int LOGICAL) {
		StringBuilder hql = new StringBuilder("from " + claz.getName());
		if (keys != null && keys.size() != 0) {
			hql.append(" where ");
		}
		String c = "=";
		String logical = " or ";
		for (int i = 0; i < keys.size() - 1; i++) {
			if (MODE == MODE_LIKE) c = " like ";
			if (LOGICAL == LOGICAL_AND) logical = " and ";
			hql.append(keys.get(i) + c + "?" + logical);
		}
		if (keys != null && keys.size() != 0) {
			hql.append(keys.get(keys.size()-1) + c +"?");
		}
		return hql.toString();
	}
	
}
