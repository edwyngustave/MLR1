package controleur;

public class Clients {
	private int IDCLIENT;
	private String NOMCLIENT;
	private String PRENOMCLIENT; 
	private String MAIL; 
	private String RAISON_SOCIALE ;
	private String ADRESSE ;
	private String CPT ;
	private String VILLE ;
	private String TELEPHONE ;

	public Clients ()
	{
		this.IDCLIENT=0;
		this.NOMCLIENT="";
		this.PRENOMCLIENT="";
		this.MAIL="";
		this.RAISON_SOCIALE = "" ;
		this.ADRESSE="";
		this.CPT= "";
		this.VILLE= "";
		this.TELEPHONE= "";
	}
	public Clients(int IDCLIENT, String NOMCLIENT, String PRENOMCLIENT,String MAIL,String RAISON_SOCIALE, String ADRESSE,String CPT, String VILLE,String TELEPHONE )
	{
		this.IDCLIENT=IDCLIENT;
		this.NOMCLIENT=NOMCLIENT;
		this.PRENOMCLIENT=PRENOMCLIENT;
		this.MAIL=MAIL;
		this.RAISON_SOCIALE = RAISON_SOCIALE;
		this.ADRESSE=ADRESSE;
		this.CPT=CPT;
		this.VILLE= VILLE;
		this.TELEPHONE=TELEPHONE;
	}
	public Clients ( String NOMCLIENT, String PRENOMCLIENT,String MAIL,String RAISON_SOCIALE, String ADRESSE, String VILLE, String CPT, String TELEPHONE)
	{
		this.IDCLIENT=0;
		this.NOMCLIENT=NOMCLIENT;
		this.PRENOMCLIENT=PRENOMCLIENT;
		this.MAIL=MAIL;
		this.RAISON_SOCIALE = RAISON_SOCIALE;
		this.ADRESSE=ADRESSE;
		this.CPT=CPT;
		this.VILLE= VILLE;
		this.TELEPHONE=TELEPHONE;
	}
	public int getIDCLIENT() {
		return IDCLIENT;
	}
	public void setIDCLIENT(int iDCLIENT) {
		IDCLIENT = iDCLIENT;
	}
	public String getNOMCLIENT() {
		return NOMCLIENT;
	}
	public void setNOMCLIENT(String nOMCLIENT) {
		NOMCLIENT = nOMCLIENT;
	}
	public String getPRENOMCLIENT() {
		return PRENOMCLIENT;
	}
	public void setPRENOMCLIENT(String pRENOMCLIENT) {
		PRENOMCLIENT = pRENOMCLIENT;
	}
	public String getMAIL() {
		return MAIL;
	}
	public void setMAIL(String mAIL) {
		MAIL = mAIL;
	}
	public String getRAISON_SOCIALE() {
		return RAISON_SOCIALE;
	}
	public void setRAISON_SOCIALE(String rAISON_SOCIALE) {
		RAISON_SOCIALE = rAISON_SOCIALE;
	}
	public String getADRESSE() {
		return ADRESSE;
	}
	public void setADRESSE(String aDRESSE) {
		ADRESSE = aDRESSE;
	}
	public String getCPT() {
		return CPT;
	}
	public void setCPT(String cPT) {
		CPT = cPT;
	}
	public String getVILLE() {
		return VILLE;
	}
	public void setVILLE(String vILLE) {
		VILLE = vILLE;
	}
	public String getTELEPHONE() {
		return TELEPHONE;
	}
	public void setTELEPHONE(String tELEPHONE) {
		TELEPHONE = tELEPHONE;
	}
}
