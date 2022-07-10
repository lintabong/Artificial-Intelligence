#include <iostream>
#include <string>
#include <math.h>
#include <stdlib.h>

using namespace std;

string Time[]      = { "13:33:59","13:34:03","13:34:06","13:34:10","13:34:14","13:34:18","13:34:21","13:34:28","13:34:30","13:34:35","13:34:40","13:34:45","13:34:50","13:34:55","13:35:00","13:35:05","13:35:10","13:35:15","13:35:20","13:35:25","13:35:30","13:35:35","13:35:40","13:35:45","13:35:50","13:35:55","13:36:00","13:36:05","13:36:10","13:36:15","13:36:20","13:36:25","13:36:30","13:36:35","13:36:40","13:36:45","13:36:50","13:36:55","13:37:00","13:37:05","13:37:10","13:37:15","13:37:20","13:37:25","13:37:30","13:37:35","13:37:40","13:37:45","13:37:50","13:37:55","13:38:00","13:38:05","13:38:10","13:38:15","13:38:20","13:38:25","13:38:30","13:38:35","13:38:40","13:38:45","13:38:50","13:38:55","13:39:00","13:39:05","13:39:10","13:39:15","13:39:20","13:39:25","13:39:30","13:39:35","13:39:40","13:39:45","13:39:50","13:39:55","13:40:00","13:40:05","13:40:10","13:40:15","13:40:20","13:40:25","13:40:30","13:40:35","13:40:40","13:40:45","13:40:50","13:40:55","13:41:00","13:41:05","13:41:10","13:41:15","13:41:20","13:41:25","13:41:30","13:41:35","13:41:40","13:41:45","13:41:50","13:41:55","13:42:00","13:42:05","13:42:10","13:42:15","13:42:20","13:42:25","13:42:30","13:42:35","13:42:40","13:42:45","13:42:50","13:42:55","13:43:15","13:43:28","13:43:34","13:43:41","13:43:45","13:43:50","13:43:55","13:44:00","13:44:05","13:44:10","13:44:15","13:44:20","13:44:25","13:44:30","13:44:35","13:44:40","13:44:45","13:44:50","13:44:55","13:44:59","16:10:50","16:10:55","16:10:59","16:11:04","16:11:11","16:11:15","16:11:21","16:11:25","16:11:30","16:11:35","16:11:40","16:11:45","16:11:50","16:11:55","16:12:00","16:12:05","16:12:10","16:12:15","16:12:20","16:12:25" };
float Api[]        = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 };
float Suhu[]       = { 26.90,26.80,26.90,26.90,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.80,26.70,26.70,26.70,26.70,26.70,26.70,26.70,26.70,26.70,26.70,26.70,26.70,26.70,26.70,26.70,26.70,26.80,26.80,26.80,26.90,27.00,27.10,27.30,27.40,27.60,27.80,28.00,28.30,28.50,29.00,29.10,29.50,29.80,30.30,30.70,30.90,31.30,31.50,31.90,32.10,32.40,32.60,32.90,33.30,33.60,33.70,34.10,34.30,35.10,35.30,37.30,38.10,38.30,38.70,38.90,39.20,39.40,39.60,39.70,39.80,40.00,40.00,40.10,40.10,40.10,40.10,40.00,39.90,39.80,23.50,23.50,23.60,23.60,23.60,23.60,23.60,23.60,23.60,23.60,23.60,23.60,23.60,23.60,23.60,23.60,23.60,23.60,23.60,23.60 };
float Kelembaban[] = { 72,72,72,72,72,72,72,72,72,72,72,71,72,72,71,71,71,72,72,73,73,73,72,73,73,73,73,74,74,74,74,74,74,74,73,74,74,74,74,75,75,74,74,74,74,74,74,75,74,75,75,75,75,75,75,75,75,75,75,75,75,74,74,74,74,74,73,73,73,73,73,73,73,73,73,73,74,74,74,74,75,75,76,76,76,76,76,76,77,78,80,80,80,82,83,82,81,83,82,82,81,83,83,84,84,83,83,83,83,84,85,85,81,80,79,78,78,77,70,61,61,65,61,59,61,52,58,59,55,54,84,84,84,84,85,85,85,85,85,84,84,84,84,84,84,84,84,84,84,85 };
float PPM[]        = { 50.14,50.89,49.77,51.64,54.34,47.57,49.48,46.15,57.53,54.73,48.30,49.77,49.77,55.13,57.13,55.92,47.57,48.30,43.37,55.13,49.77,50.51,50.89,57.94,45.44,50.89,59.59,49.03,51.26,47.12,51.64,50.89,57.13,56.72,56.32,60.84,50.51,50.89,55.82,50.51,52.02,57.94,57.13,62.54,60.84,61.69,57.53,50.14,50.14,63.84,62.54,50.89,45.44,51.26,50.89,50.89,59.59,52.79,52.79,46.86,62.11,57.94,46.50,52.52,47.21,60.84,113.87,137.88,175.32,579.39,524.37,497.46,456.54,458.20,421.24,459.86,429.08,416.58,395.34,446.71,468.21,408.90,440.24,456.54,377.77,390.89,407.38,441.85,480.10,486.99,611.53,647.10,677.55,848.97,800.19,825.59,1373.07,1240.89,1070.59,1365.43,1825.83,2967.34,3467.59,2500.15,2538.10,3055.82,2989.25,2179.71,2525.40,2748.92,3990.38,3055.82,3108.49,3231.86,3271.28,3367.6,3733.56,3724.66,3335.22,3093.37,3295.13,3311.11,2824.78,3011.3,2641.71,2838.77,2967.34,2288.24,1840.37,1636.47,47.57,48.30,57.53,43.04,53.17,56.72,47.21,50.89,49.40,51.26,48.66,48.66,53.56,46.15,52.02,54.73,54.73,51.64,45.79,46.86 };
string Label[]     = { "Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran","Tidak Kebakaran" };

const int n = sizeof(Api) / sizeof(Api[0]);

float norm(float data[], int size) {
    float max = data[0];
    float min = data[0];

    for (int i = 0; i < size; i++) {
        if (max < data[i]) {
            max = data[i];
        }
        else if (min > data[i]) {
            min = data[i];
        }
    }

    return (1023 / max);
}

float euclidean(float input[], float dataset[], int feature) {
    float distance = 0;
    for (int i = 0; i < feature; i++) {
        distance += sqrt(pow(input[i] - dataset[i], 2));
    }

    return distance;
}

void findindex(float input[], int feature, int neighbor) {
    int  intLabel[n];
    float model[n][5];

    float cf = norm(Api, n);
    float ct = norm(Suhu, n);
    float ch = norm(Kelembaban, n);
    float cp = norm(PPM, n);

    float buffdist = 0;
    int buffindex[20] = {-1};
    for (int epoch = 0; epoch < neighbor; epoch++) {
        float mindist = 10000;
        int   indexmin = 0;
        for (int i = 0; i < n; i++) {
            if (Label[i] == "Tidak Kebakaran") {
                intLabel[i] = 0;
            }
            else {
                intLabel[i] = 1;
            }

            model[i][0] = Api[i]        * cf;
            model[i][1] = Suhu[i]       * ct;
            model[i][2] = Kelembaban[i] * ch;
            model[i][3] = PPM[i]        * cp;
            model[i][4] = intLabel[i];

            for (int o = 0; o <= epoch;o++) {
                for (int p = 0; p < feature; p++) {
                    model[buffindex[o]][p] = 0;
                }
            }
            
            float dist = euclidean(input, model[i], feature);

            if (mindist > dist) {
                mindist = dist;
                indexmin = i;
            }
        }

        buffindex[epoch] = indexmin;

        printf("nearest = %.2f  \n", mindist);
        printf("index   = %d    \n", indexmin);
        printf("result  = %.0f  \n\n", model[indexmin][4]);
    }
}


int main(){
   
   float sensor[4] = { 1023 , 900, 900, 900 };
   findindex(sensor, 4, 15);

}
