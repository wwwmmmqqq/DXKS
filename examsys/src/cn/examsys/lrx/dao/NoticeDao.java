package cn.examsys.lrx.dao;

import java.util.List;

import cn.examsys.bean.Notice;

public interface NoticeDao {
	/**
	 * 获取推送数量
	 * @param userId 用户id
	 * @return 数量 
	 * 返回-1时错误
	 */
	int findNoticeCount(String userId);
	
	/**
	 * 加载推送列表
	 * @param sessionUserId
	 * @return
	 */
	List<Notice> loadNoticeList(String sessionUserId);
	
	Notice findNoticeById(int sid);
	
}
