import cv2
import mediapipe as mp
import numpy
from tensorflow.keras.models import load_model

mp_drawing = mp.solutions.drawing_utils
mp_holistic = mp.solutions.holistic

model = load_model('model.h5')
CATEGORIES = ['berdiri', 'jongkok']

cam = cv2.VideoCapture(0)
i = 0
with mp_holistic.Holistic(min_detection_confidence=0.5, min_tracking_confidence=0.5) as holistic:
    while True:
        ret ,img =cam.read()
        image = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        results = holistic.process(image)

        if results.pose_landmarks:
            for id, lm in enumerate(results.pose_landmarks.landmark):
                h, w, c = image.shape
                myL = results.pose_landmarks.landmark

        blank = numpy.zeros(shape=[img.shape[0],img.shape[1],img.shape[2]], dtype=numpy.uint8)
        mp_drawing.draw_landmarks(blank, results.pose_landmarks, mp_holistic.POSE_CONNECTIONS)
        img = cv2.flip(img,1)

        copImg = img.copy()
        try:
            # x, y, w, h = cv2.get_detection(img)
            # crop_img = blank[y:y + h, x:x + w]
            crop_img = cv2.resize(blank, (100, 100))
            crop_img = numpy.expand_dims(crop_img, axis=0)

            prediction = model.predict(crop_img)
            index = numpy.argmax(prediction)
            res = CATEGORIES[index]

            # if index == 0:
            #     color = (0, 0, 255)
            # else:
            #     color = (0, 255, 0)
            # cv2.rectangle(img, (x, y), (x + w, y + h), color, 2)
            # cv2.putText(img, res, (x, y - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.8, color, 2, cv2.LINE_AA)
            print(res)
        except:
            pass

        cv2.imshow("skeleton", blank)
        cv2.imshow("frame", img)

        if cv2.waitKey(1) & 0xFF == ord('q'):
            break


cam.release()
cv2.destroyAllWindows()
