#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import pandas as pd
import mysql.connector
from bs4 import BeautifulSoup
import os
from unidecode import unidecode
import csv
from time import sleep
from datetime import datetime
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service

servico = Service(ChromeDriverManager().install())
pd.set_option('display.max_columns', None)  # mostra todas as colunas sem truncar 


# In[ ]:


navegador = webdriver.Chrome(service=servico)


# In[ ]:


navegador.get('http://tabnet.saude.prefeitura.sp.gov.br/cgi/tabcgi.exe?secretarias/saude/TABNET/sinasc/nascido.def')
#sleep(1)


# In[ ]:


# seleciono conteudo em linha
navegador.find_element('xpath','//*[@id="L"]/option[24]').click()
sleep(1)


# In[ ]:


# seleciono distritos em coluna
navegador.find_element('xpath','//*[@id="C"]/option[7]').click()
sleep(1)


# In[ ]:


# seleciono partos em conteudo
navegador.find_element('xpath','//*[@id="I"]/option[1]').click()
sleep(1)
navegador.find_element('xpath','//*[@id="I"]/option[2]').click()


# In[ ]:


# seleciono o ano em periodos disponiveis
navegador.find_element('xpath','//*[@id="A"]/option[1]').click()
sleep(1)
navegador.find_element('xpath','//*[@id="A"]/option[2]').click()


# In[ ]:


# seleciono o mês
navegador.find_element('xpath','//*[@id="fig2"]').click()
sleep(1)
navegador.find_element('xpath','//*[@id="S2"]/option[1]').click()
sleep(1)

# Obtenha o mês atual
current_month = int(datetime.now().strftime("%m"))

# Caso para clicar na opção correta com base no mês atual
if current_month == 1:
    navegador.find_element('xpath','//*[@id="S2"]/option[2]').click()
elif current_month == 2:
    navegador.find_element('xpath','//*[@id="S2"]/option[3]').click()
elif current_month == 3:
    navegador.find_element('xpath','//*[@id="S2"]/option[4]').click()
elif current_month == 4:
    navegador.find_element('xpath','//*[@id="S2"]/option[5]').click()
elif current_month == 5:
    navegador.find_element('xpath','//*[@id="S2"]/option[6]').click()
elif current_month == 6:
    navegador.find_element('xpath','//*[@id="S2"]/option[7]').click()
elif current_month == 7:
    navegador.find_element('xpath','//*[@id="S2"]/option[8]').click()
elif current_month == 8:
    navegador.find_element('xpath','//*[@id="S2"]/option[9]').click()
elif current_month == 9:
    navegador.find_element('xpath','//*[@id="S2"]/option[10]').click()
elif current_month == 10:
    navegador.find_element('xpath','//*[@id="S2"]/option[11]').click()
elif current_month == 11:
    navegador.find_element('xpath','//*[@id="S2"]/option[12]').click()
elif current_month == 12:
    navegador.find_element('xpath','//*[@id="S2"]/option[13]').click()


# In[ ]:


# clico em mostra
navegador.find_element('xpath','/html/body/center/div/form/div[4]/div[2]/div[2]/input[1]').click()
sleep(1)


# In[ ]:


# Encontra o elemento desejado pelo XPath
element = navegador.find_element('xpath','/html/body/table[2]/tbody')

# Pega o HTML do elemento
html_content = element.get_attribute('outerHTML')


# In[ ]:


# Establish a connection to the Oracle database
connection = mysql.connector.connect(
  host="195.179.239.102",
  user="u165539734_sinascsp",
  password="Sinasc@sp24",
  database="u165539734_sinascsp"
)

# Create a cursor
cursor = connection.cursor()


# In[ ]:


# ve todos os vetores 
html = html_content

# Parse the HTML
soup = BeautifulSoup(html, "html.parser")

# Find all rows in the table
rows = soup.find_all("tr")

# Initialize a list to hold all the vectors
all_vectors = []

# Loop through each row
for row in rows:
    # Find all cells in the row
    cells = row.find_all("td")
    
    # Extract the data from the cells    #data = [cell.get_text(strip=True) for cell in cells]
    data = [cell.get_text(strip=True).replace("-", "0") for cell in cells]
    
    # Append the data to the list of vectors
    all_vectors.append(data)

# Get the current month
current_month = datetime.now().strftime("%Y-%m-%d")

# Inserir cada vetor na tabela do banco de dados
for vector in all_vectors:
    # Inserir apenas se houver dados
    if vector:
        # Adicionar o mês vigente ao vetor
        vector.append(current_month)
        
        # Converter a lista de strings em uma string separada por vírgulas
        values = ', '.join("'" + item + "'" for item in vector)
        
        # Consulta SQL para inserir os dados na tabela
        sql = f"INSERT INTO dados_sexo VALUES ({values})"
        
        # Executar a consulta
        cursor.execute(sql)

# Commit das alterações e fechamento da conexão
connection.commit()


# In[ ]:


connection.close()

