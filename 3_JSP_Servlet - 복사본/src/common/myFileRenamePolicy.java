package common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class myFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File originFile) {
		
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		int ranNum = (int)(Math.random() * 1000000);
		
		String name = originFile.getName();
		int dot = name.lastIndexOf(".");
		String ext = null;
		
		if(dot != -1) {
			ext = name.substring(dot);
		}else {
			ext = "";
		}
		String fileName = sdf.format(new Date(currentTime)) + ranNum + ext;
		File newFile = new File(originFile.getParent(), fileName);
		
		return newFile;
	}

}
