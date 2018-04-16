package com.b2c.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

public class FileUtil {
	public String newTxt(String sPath, String sFile, String sContent, String enCoding) throws FileNotFoundException {
		String s = "";
		File d = new File(sPath); // ��������SubĿ¼��File���󣬲��õ�����һ������
		if (!d.exists()) { // ���SubĿ¼�Ƿ����
			this.makeDir(sPath); // ����SubĿ¼
		}

		try {
			OutputStreamWriter out = new OutputStreamWriter(new FileOutputStream(sPath + "\\" + sFile, false),
					enCoding);
			out.write(sContent);
			out.flush();
			out.close();
		} catch (IOException ex) {
			s = "createTxt IOException Error.";
		} catch (Exception ex) {
			s = "createTxt Exception Error.";
		}

		return s;
	}

	// ·���еĶ��Ŀ¼,���������,����(mkdir��ֻ�ɽ����һ��Ŀ¼)
	public static synchronized void makeDir(String dirPath) throws FileNotFoundException {
		String s = "";

		dirPath = dirPath.replaceAll("\\t", "/t"); // replace tab key
		dirPath = dirPath.replaceAll("\\\\", "/");
		String[] aPath = dirPath.split("/");
		for (int i = 0; i < aPath.length; i++) {
			s = s + aPath[i] + "/";
			// System.out.println(s);
			File d = new File(s);
			if (!d.exists()) {
				d.mkdir();
			}
		}
	}
}