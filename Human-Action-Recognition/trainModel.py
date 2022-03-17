import os
import cv2
import time
from tqdm import tqdm
import numpy as np
from sklearn.model_selection import train_test_split
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Conv2D, Dense, MaxPooling2D, Flatten, Activation, Dropout

img_size = 100
datadir = r'myDir'  # root data directory
CATEGORIES = os.listdir(datadir)
print(CATEGORIES)

x, y = [], []


def PreProcess():
    for category in CATEGORIES:
        path = os.path.join(datadir, category)
        classIndex = CATEGORIES.index(category)
        print(path)
        for imgs in tqdm(os.listdir(path)):
            img_arr = cv2.imread(os.path.join(path, imgs))

            # resize the image
            resized_array = cv2.resize(img_arr, (img_size, img_size))
            cv2.imshow("images", resized_array)
            cv2.waitKey(1)
            resized_array = resized_array / 255.0
            x.append(resized_array)
            y.append(classIndex)


PreProcess()
cv2.destroyAllWindows()

X_train, X_test, y_train, y_test = train_test_split(x, y, test_size=0.20, random_state=42)
# rezise into numpy array
X_train = np.array(X_train).reshape(-1, img_size, img_size, 3)
y_train = np.array(y_train)
X_test = np.array(X_test).reshape(-1, img_size, img_size, 3)
y_test = np.array(y_test)

# model structure
model = Sequential()
model.add(Conv2D(64, (3, 3), input_shape=(img_size, img_size, 3)))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size=(2, 2)))
model.add(Conv2D(256, (3, 3)))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size=(2, 2)))
model.add(Conv2D(128, (3, 3)))
model.add(Activation('relu'))
model.add(Dropout(0.25))
model.add(Conv2D(32, (3, 3)))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size=(2, 2)))
model.add(Dropout(0.25))
model.add(Flatten())
model.add(Dense(100, activation='relu'))
model.add(Dense(16, activation='relu'))
model.add(Dense(len(CATEGORIES)))
model.add(Activation('softmax'))

# compile
model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])
model.summary()

batch_size = 32
epochs = 15
t1 = time.time()
# fit
model.fit(X_train, y_train, batch_size=batch_size, epochs=epochs, validation_split=0.3, verbose=1)
model.save('{}.h5'.format("model"))
t2 = time.time()
print(t2 - t1)

validation_loss, validation_accuracy = model.evaluate(X_test, y_test)
