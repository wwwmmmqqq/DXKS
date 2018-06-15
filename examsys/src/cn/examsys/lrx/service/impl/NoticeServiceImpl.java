package cn.examsys.lrx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.bean.Notice;
import cn.examsys.bean.User;
import cn.examsys.lrx.dao.impl.NoticeDaoImpl;
import cn.examsys.lrx.service.NoticeService;

@Service("noticeService")
@Transactional
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeDaoImpl dao;
	
	@Override
	public int loadNoticeCount(String sessionUserId) {
		return dao.findNoticeCount(sessionUserId);
	}

	@Override
	public List<Notice> loadNoticeList(String sessionUserId, boolean loadReadYetNotices, int page) {
		return dao.loadNoticeList(sessionUserId, loadReadYetNotices, page);
	}

	@Override 
	public void readNotice(User user, int sid) {
		Notice no = dao.findNoticeById(sid);
		if (!no.getReadsIds().contains(user.getUserId())) {
			no.setReadsIds(no.getReadsIds() + "," + user.getUserId());
		}
		try {
			dao.updateEntity(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
