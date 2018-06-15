package cn.examsys.lrx.service;

import java.util.List;

import cn.examsys.bean.Notice;
import cn.examsys.bean.User;

public interface NoticeService {
	
	/**
	 * 获取推送数量
	 * @param userId 用户id
	 * @return 数量 
	 * 返回-1时错误
	 */
	int loadNoticeCount(String sessionUserId);

	void readNotice(User user, int sid);

	List<Notice> loadNoticeList(String sessionUserId, boolean loadReadYetNotices, int page);
	
}
