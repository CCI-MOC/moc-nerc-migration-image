#!/bin/sh

: ${MIGRATE_BASE_IMAGE:=/var/lib/libvirt/images/CentOS-Stream-GenericCloud-8-20220125.1.x86_64.qcow2}
: ${MIGRATE_OUTPUT_IMAGE:=moc-nerc-migration.qcow2}

rm -f "$MIGRATE_OUTPUT_IMAGE"

tmpfile=$(mktemp imageXXXXXX.qcow2)
trap 'rm -f $tmpfile' EXIT

qemu-img create -b "$MIGRATE_BASE_IMAGE" -f qcow2 -F qcow2 "$tmpfile" 10g
virt-customize --run configure.sh --selinux-relabel -a "$tmpfile"

qemu-img convert -O qcow2 "$tmpfile" "$MIGRATE_OUTPUT_IMAGE"
