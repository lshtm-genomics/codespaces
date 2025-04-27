mkdir -p ~/git
cd ~/git
git clone https://github.com/jodyphelan/genomics_course.git

bash ~/git/genomics_course/scripts/setup_machine/03_get_non_conda_programs.sh


mkdir -p ~/.firefox
echo "user_pref(\"webgl.force-enabled\", true);" > ~/.firefox/user.js
# make alias
echo 'alias "firefox=firefox --profile ~/.firefox/"' >> ~/.bashrc


ln -s ~/miniforge3/condabin/mamba ~/bin/mamba

echo 'alias "ca=conda activate"' >> ~/.bashrc



cd ~/git/
git clone https://github.com/linfeng-wang/GenomicCourseGPT.git
mamba create --name chat --file GenomicCourseGPT/linux-env.txt
printf "cd ~/git/GenomicCourseGPT\n/home/vscode/miniforge3/envs/chat/bin/python chatbot.py\n" > ~/bin/chat
chmod +x ~/bin/chat

echo "alias mamba=/home/vscode/miniforge3/bin/mamba" >> ~/.bashrc