from llama_index.core import VectorStoreIndex, SimpleDirectoryReader, Settings
from llama_index.embeddings.huggingface import HuggingFaceEmbedding
from llama_index.llms.ollama import Ollama

documents = SimpleDirectoryReader("data").load_data()
#print(documents)

# bge-base embedding model
Settings.embed_model = HuggingFaceEmbedding(model_name="BAAI/bge-base-en-v1.5")
#print(Settings.embed_model)

# ollama
Settings.llm = Ollama(model="llama3", request_timeout=3600.0)
#print(Settings.llm)

index = VectorStoreIndex.from_documents(
    documents,
)
# print(index)

query_engine = index.as_query_engine()
# print(query_engine)
response = query_engine.query("What did the author do growing up?")
print(response)
print("End of the program")