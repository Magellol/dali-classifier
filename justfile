serve:
  flask --app app run

train:
  python train.py

test url:
  wget -qO- {{url}} | curl -X POST -F "file=@-" http://localhost:5000