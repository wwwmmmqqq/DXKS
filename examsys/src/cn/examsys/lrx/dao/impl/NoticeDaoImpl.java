package cn.examsys.lrx.dao.impl;

import java.math.BigInteger;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cn.examsys.adapters.DaoAdapter;
import cn.examsys.bean.Notice;
import cn.examsys.lrx.dao.NoticeDao;

@Repository("noticeDao")
public class NoticeDaoImpl extends DaoAdapter implements NoticeDao {
	
	@Override
	public int findNoticeCount(String userId) {
		try {
			BigInteger bi = findOneBySql("select count(sid) from notice_tb"
					+ " where locate(?, targetIds)>0 ", new Object[]{userId});
			return bi.intValue();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	@Override
	public List<Notice> loadNoticeList(String sessionUserId) {
		try {
			return findByHql("from Notice where locate(?, targetIds)>0 order by sid desc"
					, new Object[]{sessionUserId});
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Notice findNoticeById(int sid) {
		try {
			return findOneByHql("from Notice where sid=?", new Object[]{sid});
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<Notice> loadNoticeList(String sessionUserId, boolean loadReadYetNotice, int page) {
		try {
			if (loadReadYetNotice) {
				return findByHql("from Notice where locate(?, targetIds)>0 and locate(?, readsIds)>0"
						+ " order by sid desc"
						, new Object[]{sessionUserId, sessionUserId});
			} else {
				return findByHql("from Notice where locate(?, targetIds)>0 and locate(?, readsIds)<=0"
						+ " order by sid desc"
						, new Object[]{sessionUserId, sessionUserId});
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
