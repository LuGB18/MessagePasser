# Message Passer

# Abilities
- Transmit Messages to Client
- Be Able to Recieve Messages from HOST
- Be Able to Change Where the File of Data Transaction will Happend.

# Explanation on How it Works
Host makes an file where it will wait for the client, after the client inputs the name it will be shown to the host and alerted that the client's "name" is connected and ready to send the messages.
after the message gets delivered to the client the host will wait for confermation from client to start writing again for client.

# How to Change where the File Data Transaction will Happend?
for this you will create an file name "md.ini", all lowercase in the root folder where you , then at the first line you will put an directory like,
EX: C:\Temp\data.ini
and at the second you will put just the directory.
EX: C:\Temp
Remember to not store any files on this folder because HOST will Clean up the folder to make sure no files are in there.
it will re-create the folder then create the file with was name as "data.ini".
so as an example create a sub folder as:
EX:C:\Temp\sub
Host will Automactily create the folder if not found.

# Versions

| Version Publised | Still Suported |
|------------------|----------------|
|      V1.0        |       YES      |
