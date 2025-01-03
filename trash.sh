trash_dir="$HOME/.local/share/Trash/files"

show_help() {
  echo "Агрументы: "
  echo "-c : очистить корзину"
  echo "-o : открыть корзину"
}



if [[ $# -eq 0 ]]; then
  echo "Введите аргументы: -o | -c | -h"
  exit 1

fi


case "$1" in
    "-c")
      if [[ ! -d "$trash_dir" ]]; then
        echo "Коризна пуста"
        exit 1
      fi

     sudo rm -rf $HOME/.local/share/Trash/
      echo "Корзина успешно очищена!"
      ;;

    "-o")
      if [[ -d "$trash_dir" ]]; then
        ls -l "$trash_dir" --sort=time --time-style="+%d/%m/%H:%M" | awk 'BEGIN {print "Доступ\tЮзер\tДата\tМусор"} {print $1 "\t" $3 "\t" $6 "\t" $7 "\t" $8}' | grep -v '^итого' | column -t
        exit 1
      fi

      echo "Корзина пуста"
      ;;
    "-h")
      show_help
      ;;

    *)
      echo "Неизвестная команда: $1"
      ;;
esac
