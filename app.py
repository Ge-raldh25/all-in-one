from flask import Flask
import requests

app = Flask(__name__)

@app.route("/")
def devops_info():
	try:
# On récupère le résumé de l'article Wikipedia "DevOps"
	    response = requests.get("https://en.wikipedia.org/api/rest_v1/page/summary/DevOps")
	    data = response.json()
            summary = data.get("extract", "Aucune information trouvée.")
	except Exception as e:
	    summary = f"Erreur lors de la récupération des informations : {e}"

	    html = f"""
	            <h1 style='color: green;'> Informations sur le DevOps</h1>
	            <p>{summary}</p>
                    """
	return html

	if __name__ == "__main__":
	app.run(host="0.0.0.0", port=5000)
