package cn.examsys.common;

import java.util.List;

public class QLBuilder {
	
	public static String buildHQL(String hql, List<String> keys, List<String> vals, String condition) {
		StringBuilder hqlb = new StringBuilder(hql);
		
		if (keys != null && keys.size() != 0) {
			hqlb.append(" where ");
		}
		/*for (int i = 0; vals!=null && i < vals.size(); i++) {
			vals.set(i, "%"+vals.get(i)+"%");
		}*/
		for (int i = 0; i < keys.size()-1; i++) {
			hqlb.append(keys.get(i) + " "+condition+" ");
		}
		if (keys != null && keys.size() != 0) {
			hqlb.append(keys.get(keys.size()-1) + " "+condition+" ");
		}
		return hqlb.toString();
	}
	
}
