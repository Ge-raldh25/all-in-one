from flask import Flask, jsonify, request
import requests

app = Flask(__name__)

@app.route('/summary', methods=['GET'])
def get_wikipedia_summary():
    try:
        topic = request.args.get('topic')
        if not topic:
            return jsonify({"error": "Aucun sujet fourni."}), 400

        url = f"https://fr.wikipedia.org/api/rest_v1/page/summary/{topic}"
        response = requests.get(url)

        if response.status_code != 200:
            return jsonify({"error": "Erreur lors de la récupération de l'article."}), 500

        data = response.json()
        summary = data.get("extract", "Aucune information trouvée.")
        return jsonify({"summary": summary})

    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/')
def home():
    return "Bienvenue sur l'API de résumé Wikipedia (FR) !"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
