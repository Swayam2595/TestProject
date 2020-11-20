package com.myproject.model;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;

public class FileUpload {

	private List<MultipartFile> Files;
	 
    public List<MultipartFile> getFiles() {
        return Files;
    }
 
    public void setFiles(List<MultipartFile> files) {
        this.Files = files;
    }
}
