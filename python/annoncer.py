# -*- coding: utf-8 -*-
# recommandation par annonces 
import random
import math
from operator import itemgetter
import pandas as pd
import numpy as np


class ItemBasedCF():

    # initialisation les paramettres

    def __init__(self):

        self.nb_annonce_sim = 5000 #saisir des échantillons
        self.renv_nbrecom_annonces = 5  # envoiyer des resultats des recommandations 

        # séparer des données
        self.trainSet = {}
        self.testSet = {}

        # initialisation une similation de matrice de annonce
        self.annonce_sim_matrice = {}

        self.annonces_populair = {}
        self.annonces_count = 0

        # trouve des anncone simulaire
        print('=' * 100)
        print('1.charger des données......')
        print("nombre des annonces =", self.nb_annonce_sim)
        print("nombre des recommandations des annonces =", self.renv_nbrecom_annonces)

    # cherger le ficher de donnée 
    def get_dataset(self, filename, pivot=0.75):
        
        #separer deux parties, trainSet et testSet
        trainSet_len = 0
        testSet_len = 0
        #lecture des données
        users_ids,annonces_ids,ratings = self.load_donnee(filename)
        for index in range(len(users_ids)):
            user = users_ids[index]
            annonce_id = annonces_ids[index]
            rating = ratings[index]
            if (random.random() < pivot): #séparer des données au hasard
                self.trainSet.setdefault(user, {})
                self.trainSet[user][annonce_id] = rating
                trainSet_len += 1
            else:
                self.testSet.setdefault(user, {})
                self.testSet[user][annonce_id] = rating
                testSet_len += 1
    
        print('train_set = %s' % trainSet_len)
        print('test_set = %s' % testSet_len)
    
    #charger des donnees
    def load_donnee(self,filename):
        df = pd.read_csv(filename)
        user_id, annonce_id, rating,timestamp = df.columns
        return (df[user_id]).to_list(),(df[annonce_id]).to_list(),(df[rating]).to_list()

    # calculer la similation de annonce
    def calc_sim_annonce(self):
        print('=' * 100)
        print('2.générer une matrice similaire de annonce......')
        # 
        print('-' * 35 + '1.calcluer des annonces populaire annonce——popular...' + '-' * 26)
        for user, annonces in self.trainSet.items():
            for annonce in annonces:
                if annonce not in self.annonces_populair:
                    self.annonces_populair[annonce] = 0
                else:
                    self.annonces_populair[annonce] += 1
        self.annonces_count = len(self.annonces_populair)
        #print(self.annonces_populair)
        print("-" * 35 + "2.créer une realation de matrice entre toute l'annonce... " + "-" * 43)
        for user, annonces in self.trainSet.items():
            for a1 in annonces:
                for a2 in annonces:
                    if a1 == a2:
                        continue
                    #
                    self.annonce_sim_matrice.setdefault(a1, {})
                    self.annonce_sim_matrice[a1].setdefault(a2, 0)
                    self.annonce_sim_matrice[a1][a2] += 1
        print("créer la relation matrice est fini！")
        # calculer valeur similaire
        print('-' * 35 + '3.calculer la matrice similaire..  ' + '-' * 40)
        for a1, related_annonces in self.annonce_sim_matrice.items():
            for a2, count in related_annonces.items():
                # si l'annonce est pas dans le annonces populair,on met 0
                if self.annonces_populair[a1] == 0 or self.annonces_populair[a2] == 0:
                    self.annonce_sim_matrice[a1][a2] = 0
                else:
                    self.annonce_sim_matrice[a1][a2] = count / math.sqrt(self.annonces_populair[a1] * self.annonces_populair[a2])
        print('créer la matrice similair est fini！')
       # print(self.annonce_sim_matrice)

    # On cherche K annonces similaires et on recommande N annonces
    def recommend(self, user):
        K = self.nb_annonce_sim
        N = self.renv_nbrecom_annonces 
        
        rank = {}
        abonnement_annonces = self.trainSet[user]
        #print(self.annonce_sim_matrice)
        for annonce, rating in abonnement_annonces.items():
            for related_annonce, w in sorted(self.annonce_sim_matrice[annonce].items(), key=itemgetter(1), reverse=True)[:K]:
                if related_annonce in abonnement_annonces:
                    continue
                rank.setdefault(related_annonce, 0)
                # calcluer la valeure de recommandation
                rank[related_annonce] += w * float(rating)
        return sorted(rank.items(), key=itemgetter(1), reverse=True)[:N]



    def precommend(self,rec_m):
        csv_file = "annonces.csv"
        csv_data = pd.read_csv(csv_file, low_memory = False)
        df = pd.DataFrame(csv_data)
        for annonce_id,w in rec_m:
            print("titre d'annonce:",df.loc[df['annonce_Id']==int(annonce_id),'titre'].values,'valeure de recommandation:',w)



class LFMUsers:

    def __init__(self):
        csv_file = "user_ratings_annonces.csv"
        csv_data = pd.read_csv(csv_file, header= None,low_memory = False,usecols=[0,1,2])
        csv_data = csv_data.drop(0)
        self.dat = csv_data;
        user_id = csv_data.iloc[:,0].tolist()
        user_id = list(map(int,user_id))
        annonce_id = (csv_data.iloc[:,1]).tolist()
        annonce_id = list(map(int,annonce_id))
        rating = csv_data.iloc[:,2].tolist()
        rating = (csv_data.iloc[:,2]).tolist()
        self.dist_user_annonce = {} 
        print('###############################')
        for i in range(len(rating)):
            #print(type(rating[i]))
            if isinstance(rating[i],str):
                #print(i)
                pass
            else:
                print('******************')
                self.dist_user_annonce[annonce_id[i]] = user_id[i]
                rating[i] = 0
        #print(user_nouvelle)
        rating =  list(map(float,rating))
        labid = []
        m = len(set(user_id))
        n = len(set(annonce_id))
        #print(n)
        self.R = np.zeros(m*n).reshape(m,n)
        #self.R = self.R.tolist()
        #self.R = np.arange(0,m*n).reshape(m,n)
        for i in range(0,len(user_id)): 
            #print('annonce_id[i]',annonce_id[i])
            k = annonce_id[i] - 1 
            if k < 0 :
                k = annonce_id[i]
            f = user_id[i] - 1
            if f < 0:
                f = user_id[i]
            if user_id[i] not in labid:
                labid.append(user_id[i])
               # print('f = ',f)
                #print('k = ',k)
                self.R[f][k] = rating[i]
            elif user_id[i] in labid:   
                self.R[f][k] = rating[i]
            else:
                pass
        #print(self.R)           
    def initilisation(self):
        pass
    def gradient(self, K = 2, alpha = 0.00001, lamda = 0.00002, crunt = 5000):
        
        M = len(self.R)
        N = self.R.shape[1]
        P = np.random.rand(M,K)
        Q = np.random.rand(K,N)
        
        for step in range(crunt):
            for u in range(M):
                for i in range(N):
                    if self.R[u][i] > 0 :
                        erreur = np.dot(P[u,:],Q[:,i]) - self.R[u][i]
                    
                    for k in range(K):
                        P[u][k] = P[u][k] - alpha * (2 * erreur * Q[k][i] + 2 * lamda * P[u][k]) 
                        Q[k][i] = Q[k][i] - alpha * (2 * erreur * P[u][k] + 2 * lamda * Q[k][i]) 

            
            produitR = np.dot(P,Q)
            loss = 0
            for u in range(M):
                for i in range(N):
                    if self.R[u][i] > 0 :
                        loss += (np.dot(P[u,:],Q[:,i]) - self.R[u][i]) ** 2
                        for k in range(K):
                            loss += lamda * (P[u][k]**2 + Q[k][i] ** 2)


            if loss < 0.0001:
                break

        return loss,produitR

    def recommender_user(self,produitR):
        dist ={}
        for key,valeu in self.dist_user_annonce.items():
            nouvelle_annonce_ids= produitR[:,(int(key)-1)]
            R =  np.arange(1,len(l.R)+1)
            reommendations = R[nouvelle_annonce_ids>3.5].tolist()
            #reommendations_uid = self.R[reommendations]
            for i in range(len(reommendations)-1):
                if reommendations[i] == valeu:
                    reommendations.remove(reommendations[i])
            dist[key] = reommendations
        return dist

if __name__ == '__main__':
    #rating_file = "user_ratings_annonces.csv"
    #itemCF = ItemBasedCF()
    #itemCF.load_donnee(rating_file)
    #itemCF.get_dataset(rating_file)
    #x = itemCF.calc_sim_annonce()
    #user_id = input('saisez un user : ') 
    #datas = itemCF.recommend(int(user_id)) 
    #itemCF.precommend(datas) 
    l = LFMUsers()
    loss,produitR = l.gradient()
    l.recommender_user(produitR)
  
