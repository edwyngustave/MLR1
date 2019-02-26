package controleur;

public class Article {
	private int IDPRODUIT ;
	private String NOMP ;
	private float PRIXHT ; 
	private int QUANTITESTOCK ; 

	public Article ()
	{
		this.IDPRODUIT = 0;
		this.NOMP = "";
		this.PRIXHT = 0;
		this.QUANTITESTOCK = 0;	
	}
	public Article (int IDPRODUIT, String NOMP, float PRIXHT,int QUANTITESTOCK)
	{
		this.IDPRODUIT = IDPRODUIT;
		this.NOMP = NOMP;
		this.PRIXHT = PRIXHT;
		this.QUANTITESTOCK = QUANTITESTOCK;
	}
	public Article (String NOMP, float PRIXHT,int QUANTITESTOCK)
	{
		this.IDPRODUIT = 0;
		this.NOMP = NOMP;
		this.PRIXHT = PRIXHT;
		this.QUANTITESTOCK = QUANTITESTOCK;
	}
	public int getIDPRODUIT() {
		return IDPRODUIT;
	}
	public void setIDPRODUIT(int iDPRODUIT) {
		this.IDPRODUIT = iDPRODUIT;
	}
	public String getNOMP() {
		return NOMP;
	}
	public void setNOMP(String nOMP) {
		this.NOMP = nOMP;
	}
	public float getPRIXHT() {
		return PRIXHT;
	}
	public void setPRIXHT(float pRIXHT) {
		this.PRIXHT = pRIXHT;
	}
	public int getQUANTITESTOCK() {
		return QUANTITESTOCK;
	}
	public void setQUANTITESTOCK(int qUANTITESTOCK) {
		this.QUANTITESTOCK = qUANTITESTOCK;
	}

}
