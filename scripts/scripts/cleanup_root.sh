#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
#set -x

if [[ $(id -u) -ne 0 ]] ; then
	echo "You need to run it as root."
	exit 1
fi

disk_stat() {
	dfc | grep -E "[ 	]/[ 	]"
}

relocate_games() {
	games_dest_dir="$1"
	shift
	games_prefix="$1"
	shift
	games_list=("${@}")
	for game in "${games_list[@]}"; do
		old_game_path=${games_prefix}/${game}
		new_game_path=${games_dest_dir}/${game}
		if [[ ! -L "${old_game_path}" ]] && [[ -d "${old_game_path}" ]] ; then
			echo "Moving '$game' to $(readlink -e "${games_dest_dir}") ..."
			(
				if [[ -d "${new_game_path}" ]] ; then
					rm -r "${new_game_path}"
				fi
				mv "${old_game_path}" "${games_dest_dir}/"
				ln -s "${new_game_path}" "${old_game_path}"
			)
		fi
	done
}


disk_stat
echo

docker_status=0
sudo systemctl status docker --no-pager || docker_status=$?
if [[ ${docker_status} -ne 0 ]] ; then
	sudo systemctl start docker || true
fi
#docker container prune -f || true
#docker image prune -f || true
#docker system prune -f || true
#docker system prune -af --volumes || true
docker system prune -f --volumes || true
if [[ ${docker_status} -ne 0 ]] ; then
	sudo systemctl stop docker || true
fi


#pikaur -Scc --repo --noconfirm
echo
echo

set -x
rm -fr /var/lib/systemd/coredump/* || true


#games_dest_dir="/opt/games"

#opt_games_dir="/opt"
#opt_games_list=(
#    'Pokemon Revolution'
#    'teamviewer'
#    'urbanterror'
#    'warsow'
#    'thedarkmod'
#    'GuitarPro6'
#    'bitwig-studio.bak'
#    'oomox'
#)
#relocate_games "${games_dest_dir}" "${opt_games_dir}" "${opt_games_list[@]}"

#games_dest_dir="/media/old_media/ai/system"

#opt_games_dir="/opt"
#opt_games_list=(
#    'cuda'
#)
#relocate_games "${games_dest_dir}" "${opt_games_dir}" "${opt_games_list[@]}"

#usr_share_games_dir="/usr/share"
#usr_share_games_list=(
#    'xonotic'
#    'supertuxkart'
#)
#relocate_games "${games_dest_dir}" "${usr_share_games_dir}" "${usr_share_games_list[@]}"

#rm -fr /opt/user_cache/spotify/Data/*

set +x

echo
echo
disk_stat
