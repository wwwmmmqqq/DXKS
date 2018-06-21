package cn.examsys.lrx.vo;

import java.util.ArrayList;
import java.util.List;

public class ConstituteVO {
	
	int count;
	int diff1Percent;
	int diff2Percent;
	int diff3Percent;
	int diff4Percent;
	int diff1Point;
	int diff2Point;
	int diff3Point;
	int diff4Point;
	
	List<Integer> tnPoint = new ArrayList<>();
	
	public List<Integer> getTnPoint() {
		return tnPoint;
	}
	public void setTnPoint(List<Integer> tnPoint) {
		this.tnPoint = tnPoint;
	}
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getDiff1Percent() {
		return diff1Percent;
	}
	public void setDiff1Percent(int diff1Percent) {
		this.diff1Percent = diff1Percent;
	}
	public int getDiff2Percent() {
		return diff2Percent;
	}
	public void setDiff2Percent(int diff2Percent) {
		this.diff2Percent = diff2Percent;
	}
	public int getDiff3Percent() {
		return diff3Percent;
	}
	public void setDiff3Percent(int diff3Percent) {
		this.diff3Percent = diff3Percent;
	}
	public int getDiff4Percent() {
		return diff4Percent;
	}
	public void setDiff4Percent(int diff4Percent) {
		this.diff4Percent = diff4Percent;
	}
	public int getDiff1Point() {
		return diff1Point;
	}
	public void setDiff1Point(int diff1Point) {
		this.diff1Point = diff1Point;
	}
	public int getDiff2Point() {
		return diff2Point;
	}
	public void setDiff2Point(int diff2Point) {
		this.diff2Point = diff2Point;
	}
	public int getDiff3Point() {
		return diff3Point;
	}
	public void setDiff3Point(int diff3Point) {
		this.diff3Point = diff3Point;
	}
	public int getDiff4Point() {
		return diff4Point;
	}
	public void setDiff4Point(int diff4Point) {
		this.diff4Point = diff4Point;
	}
	@Override
	public String toString() {
		return "ConstituteVO [count=" + count + ", diff1Percent="
				+ diff1Percent + ", diff2Percent=" + diff2Percent
				+ ", diff3Percent=" + diff3Percent + ", diff4Percent="
				+ diff4Percent + ", diff1Point=" + diff1Point + ", diff2Point="
				+ diff2Point + ", diff3Point=" + diff3Point + ", diff4Point="
				+ diff4Point + ", tnPoint=" + tnPoint + "]";
	}
	
}
