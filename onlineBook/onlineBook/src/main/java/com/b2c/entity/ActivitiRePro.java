package com.b2c.entity;

public class ActivitiRePro {
	
	private int REV_;
	private String CATEGORY_;
	private String NAME_;
	private String KEY_;
	public int getREV_() {
		return REV_;
	}
	public void setREV_(int rEV_) {
		REV_ = rEV_;
	}
	public String getCATEGORY_() {
		return CATEGORY_;
	}
	public void setCATEGORY_(String cATEGORY_) {
		CATEGORY_ = cATEGORY_;
	}
	public String getNAME_() {
		return NAME_;
	}
	public void setNAME_(String nAME_) {
		NAME_ = nAME_;
	}
	public String getKEY_() {
		return KEY_;
	}
	public void setKEY_(String kEY_) {
		KEY_ = kEY_;
	}
	public ActivitiRePro(int rEV_, String cATEGORY_, String nAME_, String kEY_) {
		super();
		REV_ = rEV_;
		CATEGORY_ = cATEGORY_;
		NAME_ = nAME_;
		KEY_ = kEY_;
	}
	public ActivitiRePro() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ActivitiRePro [REV_=" + REV_ + ", CATEGORY_=" + CATEGORY_
				+ ", NAME_=" + NAME_ + ", KEY_=" + KEY_ + "]";
	}
	
	
	
}
