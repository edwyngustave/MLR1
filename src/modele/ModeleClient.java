package modele;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import controleur.Clients;

public class ModeleClient {
	private static BDD uneBDD = new BDD("localhost", "MLR1", "root", "");
	
	public static ArrayList<Clients> SelectAllClients(){
		ArrayList<Clients> lesClients = new ArrayList<Clients>();
		String requete = "select * from client;";
		Modele.uneBDD.seConnecter();
		try {
			Statement unStat = Modele.uneBDD.getMaConnexion().createStatement();
			ResultSet desResultats = unStat.executeQuery(requete);
			while(desResultats.next()) {
				Clients unClients = new Clients(
						desResultats.getInt("IDCLIENT"),
						desResultats.getString("NOMCLIENT"),
						desResultats.getString("PRENOMCLIENT"),
						desResultats.getString("MAIL"),
						desResultats.getString("RAISON_SOCILE"),
						desResultats.getString("ADRESSE"),
						desResultats.getString("CPT"),
						desResultats.getString("VILLE"),
						desResultats.getString("TELEPHONE")
						
						);
				lesClients.add(unClients);
			}
		} catch (SQLException e) {
			System.out.println("Erreur d'execution de la requete " + requete);
		}
		Modele.uneBDD.seDeconnecter();
		return lesClients;
	}
	
	public static void insertClients(Clients unClients) {
		Modele.uneBDD.seConnecter();
		String requete = " insert into client values (0, '"+unClients.getNOMCLIENT()+"', '"+unClients.getPRENOMCLIENT()+"', '"+unClients.getMAIL()+"', '"+unClients.getRAISON_SOCIALE()+"', '"+unClients.getADRESSE()+"', '"+unClients.getCPT()+"', '"+unClients.getVILLE()+"', '"+unClients.getTELEPHONE()+"');";
		try {
			Statement unStat = Modele.uneBDD.getMaConnexion().createStatement();
			unStat.execute(requete);
			
		} catch (SQLException e) {
			System.out.println("Erreur lors de la requete : " + requete);
		}
		Modele.uneBDD.seDeconnecter();
	}
	
	public static void updateClients(Clients unClients) {
		Modele.uneBDD.seConnecter();
		String requete = "update client set NOMCLIENT ='"+unClients.getNOMCLIENT()
                +"', PRENOMCLIENT = '"+unClients.getPRENOMCLIENT()+"',MAIL = '"+unClients.getMAIL()+
                "',RAISON_SOCIALE ='"+unClients.getRAISON_SOCIALE()+"', ADRESSE = '"+unClients.getADRESSE()+
                "',CPT ='"+unClients.getCPT()+"', VILLE ='"+unClients.getVILLE()+"', TELEPHONE ='"+unClients.getTELEPHONE()+"'  where "
                        + " IDCLIENT = "+unClients.getIDCLIENT()+" ;";
		try {
			Statement unStat = Modele.uneBDD.getMaConnexion().createStatement();
			unStat.execute(requete);
			
		} catch (SQLException e) {
			System.out.println("Erreur lors de la requete : " + requete);
		}
		Modele.uneBDD.seDeconnecter();
	}
	
	public static void deleteClients(int IDCLIENT) {
		Modele.uneBDD.seConnecter();
		String requete = " delete from client where IDCLIENT = " + IDCLIENT + ";"; 
		try {
			Statement unStat = Modele.uneBDD.getMaConnexion().createStatement();
			unStat.execute(requete);
			
		} catch (SQLException e) {
			System.out.println("Erreur lors de la requete : " + requete);
		}
		Modele.uneBDD.seDeconnecter();
	}
	public static Clients selectWhereClients(Clients unClients) {
		String requete = "select * client where NOMCLIENT ='"+unClients.getNOMCLIENT()
                +"' and PRENOMCLIENT = '"+unClients.getPRENOMCLIENT()+"' and MAIL = '"+unClients.getMAIL()+
                "' and RAISON_SOCIALE ='"+unClients.getRAISON_SOCIALE()+"' and ADRESSE = '"+unClients.getADRESSE()+
                "' and CPT ='"+unClients.getCPT()+"' and VILLE ='"+unClients.getVILLE()+"' and TELEPHONE ='"+unClients.getTELEPHONE()+"'  where "
                        + " IDCLIENT = "+unClients.getIDCLIENT()+" ;";
		Clients unArt = null;
		Modele.uneBDD.seConnecter();
		try {
			Statement unStat = Modele.uneBDD.getMaConnexion().createStatement();
			ResultSet unRes = unStat.executeQuery(requete);
			if(unRes.next())
			{
				unArt = new Clients(
						unRes.getInt("IDCLIENT"),
						unRes.getString("NOMCLIENT"),
						unRes.getString("PRENOMCLIENT"),
						unRes.getString("MAIL"),
						unRes.getString("RAISON_SOCIALE"),
						unRes.getString("ADRESSE"),
						unRes.getString("CPT"),
						unRes.getString("VILLE"),
						unRes.getString("TELEPHONE")
						);
			}
			
		} catch (SQLException exp) {
			System.out.println("Erreur lors de la requete : " + requete);
			exp.printStackTrace();
		}
		Modele.uneBDD.seDeconnecter();
		return unArt;
	}
}
