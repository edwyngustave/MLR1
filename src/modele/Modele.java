package modele;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import controleur.Article;

public class Modele {
	static BDD uneBDD = new BDD("localhost", "MLR1", "root", "");
	
	public static ArrayList<Article> SelectAllArticles(){
		ArrayList<Article> lesArticles = new ArrayList<Article>();
		String requete = "select * from produit;";
		Modele.uneBDD.seConnecter();
		try {
			Statement unStat = Modele.uneBDD.getMaConnexion().createStatement();
			ResultSet desResultats = unStat.executeQuery(requete);
			while(desResultats.next()) {
				Article unArticle = new Article(
						desResultats.getInt("IDPRODUIT"),
						desResultats.getString("NOMP"),
						desResultats.getFloat("PRIXHT"),
						desResultats.getInt("QUANTITESTOCK")
						);
				lesArticles.add(unArticle);
			}
		} catch (SQLException e) {
			System.out.println("Erreur d'execution de la requete " + requete);
		}
		Modele.uneBDD.seDeconnecter();
		return lesArticles;
	}
	
	public static void insertArticle(Article unArticle) {
		Modele.uneBDD.seConnecter();
		String requete = " insert into produit (NOMP, PRIXHT, QUANTITESTOCK) values ('" + unArticle.getNOMP() + "'," + unArticle.getPRIXHT() + "," + unArticle.getQUANTITESTOCK() + ");";
		try {
			Statement unStat = Modele.uneBDD.getMaConnexion().createStatement();
			unStat.execute(requete);
			
		} catch (SQLException e) {
			System.out.println("Erreur lors de la requete : " + requete);
		}
		Modele.uneBDD.seDeconnecter();
	}
	
	public static void updateArticle(Article unArticle) {
		Modele.uneBDD.seConnecter();
		String requete = "update produit set NOMP = '" + unArticle.getNOMP() + "', PRIXHT = " + unArticle.getPRIXHT() + ",  = " + unArticle.getQUANTITESTOCK() 
		+ "' where IDPRODUIT = " + unArticle.getIDPRODUIT() + ";";
		try {
			Statement unStat = Modele.uneBDD.getMaConnexion().createStatement();
			unStat.execute(requete);
			
		} catch (SQLException e) {
			System.out.println("Erreur lors de la requete : " + requete);
		}
		Modele.uneBDD.seDeconnecter();
	}
	
	public static void deleteArticle(int IDPRODUIT) {
		Modele.uneBDD.seConnecter();
		String requete = " delete from produit where IDPRODUIT = " + IDPRODUIT + ";"; 
		try {
			Statement unStat = Modele.uneBDD.getMaConnexion().createStatement();
			unStat.execute(requete);
			
		} catch (SQLException e) {
			System.out.println("Erreur lors de la requete : " + requete);
		}
		Modele.uneBDD.seDeconnecter();
	}
	public static Article selectWhereArticle(Article unArticle) {
		String requete = "select * from produit where NOMP = '" + unArticle.getNOMP() + "' and PRIXHT = " + unArticle.getPRIXHT() + " and QUANTITESTOCK = " + unArticle.getQUANTITESTOCK() 
		+ ";";
		Article unArt = null;
		Modele.uneBDD.seConnecter();
		try {
			Statement unStat = Modele.uneBDD.getMaConnexion().createStatement();
			ResultSet unRes = unStat.executeQuery(requete);
			if(unRes.next())
			{
				unArt = new Article(
						unRes.getInt("IDPRODUIT"),
						unRes.getString("NOMP"),
						unRes.getFloat("PRIXHT"),
						unRes.getInt("QUANTITESTOCK")
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
