package br.com.marcus.testes;

public class TesteEscola {
	public static void main(String[] args){
//		Thumbnails.of(new File("path/to/directory").listFiles())
//	    .size(640, 480)
//	    .outputFormat("jpg")
//	    .toFiles(Rename.PREFIX_DOT_THUMBNAIL);
//    }
		String json = "id1=263&id2=21"; 
		Long id1 = new Long(json.substring(4,json.indexOf("&")));
		Long id2 = new Long(json.substring(json.indexOf("id2")+4));
		System.out.println(id1 + ", " + id2);
	}
}
